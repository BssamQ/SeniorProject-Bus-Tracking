import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

import '../Screens/route_loader.dart';
import '../Screens/bus_simulator.dart';

// ✅ BusSimulator is in the same folder (Screens)

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  HomeScreen({required this.isDarkMode, required this.onThemeChanged});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "Guest";
  bool _isDarkMode = false;
  LatLng? pickupPosition;
  LatLng? destinationPosition;
  bool showRoute = false;
  String? pickupLocation;
  String? destinationLocation;

  late BusSimulator _busSimulator;
  LatLng _busPosition = LatLng(26.3123370, 50.1422222);

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _fetchUsername();
    _loadSavedRoute();
    _initBusSimulator();
  }

  void _initBusSimulator() async {
    final goRoute = await JsonRouteLoader.loadFullGoRoute();
    final returnRoute = await JsonRouteLoader.loadFullReturnRoute();

    final goStations = await JsonRouteLoader.getStationIndices(goRoute);
    final returnStations = await JsonRouteLoader.getStationIndices(returnRoute);

    _busSimulator = BusSimulator(
      goRoute: goRoute,
      returnRoute: returnRoute,
      goStationIndices: goStations,
      returnStationIndices: returnStations,
      onLocationUpdated: (LatLng pos) {
        setState(() {
          _busPosition = pos;
        });
      },
    );

    _busSimulator.start();
  }

  @override
  void dispose() {
    _busSimulator.stop();
    super.dispose();
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedDarkMode = prefs.getBool('darkMode') ?? false;
    setState(() {
      _isDarkMode = savedDarkMode;
    });
  }

  void _fetchUsername() {
    var userInfo = sessionManager.signedInUser;
    setState(() {
      username = userInfo?.userName ?? "Guest";
    });
  }

  Future<void> _loadSavedRoute() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedPickup = prefs.getString('pickup');
    String? savedDestination = prefs.getString('destination');
    if (savedPickup != null && savedDestination != null) {
      setState(() {
        pickupLocation = savedPickup;
        destinationLocation = savedDestination;
        showRoute = true;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          // Map
          FlutterMap(
            options: MapOptions(
              initialCenter: _busPosition,
              initialZoom: 16.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              if (showRoute && pickupPosition != null && destinationPosition != null)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: [pickupPosition!, destinationPosition!],
                      color: Colors.blue,
                      strokeWidth: 4,
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _busPosition,
                    width: 40,
                    height: 40,
                    child: Icon(Icons.directions_bus, color: Colors.green, size: 40),
                  ),
                  if (pickupPosition != null)
                    Marker(
                      point: pickupPosition!,
                      width: 40,
                      height: 40,
                      child: Icon(Icons.location_pin, color: Colors.orange, size: 40),
                    ),
                  if (destinationPosition != null)
                    Marker(
                      point: destinationPosition!,
                      width: 40,
                      height: 40,
                      child: Icon(Icons.location_pin, color: Colors.blue, size: 40),
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 25, // Standard status bar height (can adjust)
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5) // Dark mode: dark gray semi-transparent
              ),
            ),
          ),

          // 🔽 Back + Person buttons
          // Back Button (Left)
          Positioned(
            top: 70,
            left: 20,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.black.withOpacity(0.8),
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 26, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

// Person Button (Right)
          Positioned(
            top: 70,
            right: 20,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.black.withOpacity(0.8),
              child: IconButton(
                icon: Icon(Icons.person, size: 26, color: Colors.white),
                onPressed: () async {
                  await Navigator.pushNamed(context, '/preferences');
                  _loadPreferences();
                },
              ),
            ),
          ),


          // 🔽 Bottom Buttons (Explore + Select Route)
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Explorer button stays the same
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  // icon: Icon(Icons.explore),
                  label: Text('Explore'),
                ),
                const SizedBox(height: 12),
                // Select Route button adapts to dark mode
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.isDarkMode ? Colors.grey[900] : Color(0xFF008540),
                    foregroundColor: widget.isDarkMode ? Color(0xFF00FF66) : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/select_route');
                  },
                  icon: Icon(Icons.directions),
                  label: Text('Select Route'),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

}
