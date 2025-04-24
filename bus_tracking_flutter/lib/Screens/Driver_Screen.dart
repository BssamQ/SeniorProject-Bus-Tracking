import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../Screens/bus_simulator.dart';
import '../Screens/route_loader.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  bool isTripStarted = false;
  LatLng _busPosition = LatLng(26.3055, 50.1425);
  final LatLng nextStationLocation = LatLng(26.3070, 50.1450);
  Timer? movementTimer;

  late BusSimulator _busSimulator;

  final String busNumber = "BUS-204";
  final String driverName = "Mohammed Ahmed";
  final String routeName = "Route 1";
  final String nextStop = "Building 57";

  @override
  void initState() {
    super.initState();
    _initBusSimulator();
  }

  Future<void> _initBusSimulator() async {
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
  }

  @override
  void dispose() {
    _busSimulator.stop();
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
        backgroundColor: Colors.grey[900],
        title: const Text('Emergency Alert',
            style: TextStyle(color: Colors.white)),
        content: const Text('Are you sure you want to report an emergency?',
            style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text('Cancel', style: TextStyle(color: Colors.redAccent)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Emergency reported!');
            },
            child: const Text('Confirm',
                style: TextStyle(color: Colors.greenAccent)),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: _busPosition,
              initialZoom: 15.5,
              keepAlive: true,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [_busPosition, nextStationLocation],
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
                    child: const Icon(Icons.directions_bus,
                        color: Colors.green, size: 40),
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
          ),

          // EXIT ICON (top-left) → go back to login screen
          Positioned(
            top: 40,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
              ),
            ),
          ),

          // PROFILE ICON (top-right) → preferences
          Positioned(
            top: 40,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () async {
                  await Navigator.pushNamed(context, '/preferences');
                },
              ),
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
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bus Details',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 4),
                  Text('Bus ID: $busNumber',
                      style: const TextStyle(color: Colors.white70)),
                  Text('Driver: $driverName',
                      style: const TextStyle(color: Colors.white70)),
                  const Divider(color: Colors.white24),
                  const Text('Route Info',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('Route: $routeName',
                      style: const TextStyle(color: Colors.white70)),
                  Text('Next Stop: $nextStop',
                      style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: _toggleTrip,
                    icon: Icon(isTripStarted ? Icons.stop : Icons.play_arrow),
                    label: Text(isTripStarted ? 'End Trip' : 'Start Trip'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isTripStarted ? Colors.red : Colors.green,
                      minimumSize: const Size.fromHeight(40),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _showEmergencyDialog,
                    icon: const Icon(Icons.warning),
                    label: const Text('Emergency'),
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
