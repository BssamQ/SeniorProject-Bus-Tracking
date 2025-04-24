// Top of file
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';

import '../Screens/bus_simulator.dart';
import '../Screens/route_loader.dart';
import '../main.dart';
import 'package:bus_tracking_client/bus_tracking_client.dart' as protocol;

class DriverScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;
  const DriverScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  bool isTripStarted = false;
  bool isLoading = true;
  bool isDriver = false;
  bool hasRoute = true;

  String? driverName;
  String? busNumber;
  String? routeName;
  String nextStop = "Building 57";

  final TextEditingController _emergencyController = TextEditingController();
  List<protocol.Notification> _notifications = [];

  LatLng _busPosition = LatLng(26.3055, 50.1425);
  final LatLng nextStationLocation = LatLng(26.3061739, 50.1477596);
  Timer? movementTimer;
  late BusSimulator _busSimulator;
  List<LatLng>? _routePolylinePoints;

  late bool _isDarkMode = widget.isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
    _initUserAndBus();
    _loadNotifications();
  }


  Future<void> _initUserAndBus() async {
    try {
      final role = await client.user.getUserRole();
      if (role == "Driver") {
        final userInfo = sessionManager.signedInUser;
        final user = await client.user.getUserById(id: userInfo?.id ?? 1);

        if (user != null) {
          final driverInfo = await client.driverInfo.getDriverByUserInfoId(user.id!);
          final bus = driverInfo != null ? await client.bus.getBusById(driverInfo.busId) : null;
          final route = bus != null && bus.routeID != null
              ? await client.route.getRouteById(bus.routeID!)
              : null;

          setState(() {
            isDriver = true;
            driverName = userInfo?.userName ?? "Unknown";
            busNumber = bus?.busNumber ?? "Unknown";
            routeName = route?.routeName ?? "Not assigned";
            hasRoute = route != null;
          });

          if (hasRoute) {
            final goRoute = await JsonRouteLoader.loadFullGoRoute();
            final returnRoute = await JsonRouteLoader.loadFullReturnRoute();
            final goStations = await JsonRouteLoader.getStationIndices(goRoute);
            final returnStations = await JsonRouteLoader.getStationIndices(returnRoute);

            _busSimulator = BusSimulator(
              goRoute: goRoute,
              returnRoute: returnRoute,
              goStationIndices: goStations,
              returnStationIndices: returnStations,
              onLocationUpdated: (LatLng pos) async {
                setState(() {
                  _busPosition = pos;
                });
                await _fetchRoutePolyline(pos, nextStationLocation);
              },
            );

            await _fetchRoutePolyline(_busPosition, nextStationLocation);
          }
        }
      }
    } catch (e) {
      print("Error loading driver data: $e");
    }

    setState(() => isLoading = false);
  }

  Future<void> _fetchRoutePolyline(LatLng start, LatLng end) async {
    try {
      final openRouteClient = OpenRouteService(
        apiKey: '5b3ce3597851110001cf6248518ebe30153142b3b996dfcd4be85b44',
      );

      final coords = await openRouteClient.directionsRouteCoordsGet(
        startCoordinate: ORSCoordinate(latitude: start.latitude, longitude: start.longitude),
        endCoordinate: ORSCoordinate(latitude: end.latitude, longitude: end.longitude),
      );

      setState(() {
        _routePolylinePoints = coords.map((c) => LatLng(c.latitude, c.longitude)).toList();
      });
    } catch (e) {
      print("Error fetching ORS route: $e");
    }
  }

  @override
  void dispose() {
    _emergencyController.dispose();
    if (hasRoute) _busSimulator.stop();
    movementTimer?.cancel();
    super.dispose();
  }

  void _toggleTrip() {
    setState(() => isTripStarted = !isTripStarted);
    if (isTripStarted) {
      _busSimulator.start();
    } else {
      _busSimulator.stop();
    }
  }

  void _showEmergencyDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        title: Text('Report Emergency',
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black)),
        content: TextField(
          controller: _emergencyController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Describe the emergency...',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final message = _emergencyController.text.trim();
              if (message.isEmpty) return;
              Navigator.pop(context);
              await _sendEmergencyNotification(message);
              _emergencyController.clear();
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  Future<void> _sendEmergencyNotification(String message) async {
    final userInfo = sessionManager.signedInUser;
    if (userInfo == null) return;

    final driver = await client.driverInfo.getDriverByUserInfoId(userInfo.id!);
    if (driver == null) return;

    final notification = protocol.Notification(
      userID: driver.id!,
      type: 'Emergency',
      message: message,
      readStatus: 'Unread',
      timestamp: DateTime.now(),
    );

    await client.notification.addNotification(notification);
    _showSnackBar('Emergency reported!');
    await _loadNotifications(); // Refresh list
  }

  Future<void> _loadNotifications() async {
    final userInfo = sessionManager.signedInUser;
    if (userInfo == null) return;

    final driver = await client.driverInfo.getDriverByUserInfoId(userInfo.id!);
    if (driver == null) return;

    final fetched = await client.notification.getNotificationsByUserId(driver.id!);
    setState(() {
      _notifications = fetched.where((n) => n.type == 'Emergency'  && n.readStatus != 'Read').cast<protocol.Notification>().toList();
    });
  }

  Future<void> _markAsRead(protocol.Notification notif) async {
    await client.notification.markNotificationAsRead(notif.id!);
    await _loadNotifications(); // Refresh list
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showNotificationPopup() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        title: const Text('My Emergency Reports'),
        content: SizedBox(
          width: double.maxFinite,
          child: _notifications.isEmpty
              ? const Text("No emergency messages yet.")
              : ListView.builder(
            shrinkWrap: true,
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final notif = _notifications[index];
              final isRead = notif.readStatus == 'Read';

              return ListTile(
                leading: Icon(Icons.warning, color: Colors.orange),
                title: Text(
                  notif.message,
                  style: TextStyle(
                    fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                subtitle: Text('Status: ${notif.readStatus}'),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,

        body: const Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    if (!isDriver) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'Access denied.\nThis page is only available for drivers.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          hasRoute
              ? FlutterMap(
            options: MapOptions(
              initialCenter: _busPosition,
              initialZoom: 15.5,
              keepAlive: true,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              if (_routePolylinePoints != null)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePolylinePoints!,
                      strokeWidth: 4,
                      color: Colors.orange,
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _busPosition,
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.directions_bus, color: Colors.green, size: 40),
                  ),
                  Marker(
                    point: nextStationLocation,
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.flag, color: Colors.blue, size: 40),
                  ),
                ],
              ),
            ],
          )
              : const Center(
            child: Text(
              'No route assigned to your bus.\nPlease contact the admin.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ),

          // EXIT ICON
          Positioned(
            top: 40,
            left: 15,
            child: Container(
              decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
              ),
            ),
          ),

          // PROFILE + NOTIFICATION ICON
          Positioned(
            top: 40,
            right: 15,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: _isDarkMode ? Colors.white : Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.notifications, color: _isDarkMode ? Colors.orange : Colors.white),
                    onPressed: _showNotificationPopup,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: _isDarkMode ? Colors.white : Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.person, color: _isDarkMode ? Colors.black : Colors.white),
                    onPressed: () async {
                      await Navigator.pushNamed(context, '/preferences');
                    },
                  ),
                ),

              ],
            ),
          ),


          // INFO PANEL
          Positioned(
            top: 90,
            right: 10,
            child: Container(
              width: 250,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bus Details',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text('Bus ID: $busNumber', style: const TextStyle(color: Colors.white70)),
                  Text('Driver: $driverName', style: const TextStyle(color: Colors.white70)),
                  const Divider(color: Colors.white24),
                  const Text('Route Info',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text('Route: $routeName', style: const TextStyle(color: Colors.white70)),
                  Text('Next Stop: $nextStop', style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: hasRoute ? _toggleTrip : null,
                    icon: Icon(isTripStarted ? Icons.stop : Icons.play_arrow, color: Colors.black),
                    label: Text(isTripStarted ? 'End Trip' : 'Start Trip', style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isTripStarted ? Colors.red : Colors.green,
                      minimumSize: const Size.fromHeight(40),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _showEmergencyDialog,
                    icon: Icon(Icons.warning, color: Colors.black), // icon color
                    label: Text(
                      'Emergency',
                      style: TextStyle(color: Colors.black), // text color
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size.fromHeight(40),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
