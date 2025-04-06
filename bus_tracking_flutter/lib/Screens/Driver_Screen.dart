import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  bool isTripStarted = false;
  bool isSharingLocation = false;
  LatLng currentBusLocation = LatLng(26.3055, 50.1425);
  final LatLng nextStationLocation = LatLng(26.3070, 50.1450);
  Timer? movementTimer;

  void _toggleTrip() {
    if (isSharingLocation) {
      setState(() {
        isTripStarted = !isTripStarted;
      });

      if (isTripStarted) {
        _startBusMovement();
      } else {
        movementTimer?.cancel();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please share live location first!')),
      );
    }
  }

  void _toggleLocation() {
    setState(() {
      isSharingLocation = !isSharingLocation;
    });

    if (!isSharingLocation && isTripStarted) {
      setState(() {
        isTripStarted = false;
      });
      movementTimer?.cancel();
    }
  }

  void _startBusMovement() {
    movementTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentBusLocation =
            _moveTowards(currentBusLocation, nextStationLocation, 0.0004);
      });

      if (_reachedDestination(currentBusLocation, nextStationLocation)) {
        timer.cancel();
        setState(() {
          isTripStarted = false;
        });
      }
    });
  }

  LatLng _moveTowards(LatLng from, LatLng to, double step) {
    final double latDiff = to.latitude - from.latitude;
    final double lngDiff = to.longitude - from.longitude;
    return LatLng(
      from.latitude + (latDiff * step),
      from.longitude + (lngDiff * step),
    );
  }

  bool _reachedDestination(LatLng a, LatLng b) {
    const threshold = 0.0003;
    return (a.latitude - b.latitude).abs() < threshold &&
        (a.longitude - b.longitude).abs() < threshold;
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Emergency reported!')),
              );
            },
            child: const Text('Confirm',
                style: TextStyle(color: Colors.greenAccent)),
          ),
        ],
      ),
    );
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void dispose() {
    movementTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Driver Dashboard',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Bus Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const ListTile(
              title: Text('Bus ID', style: TextStyle(color: Colors.white70)),
              subtitle: Text('BUS-204', style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              title:
                  Text('Plate Number', style: TextStyle(color: Colors.white70)),
              subtitle: Text('XYZ 4567', style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              title: Text('Capacity', style: TextStyle(color: Colors.white70)),
              subtitle:
                  Text('45 passengers', style: TextStyle(color: Colors.white)),
            ),
            const Divider(color: Colors.white24),
            const Text('Route Info',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const ListTile(
              title: Text('Route', style: TextStyle(color: Colors.white70)),
              subtitle: Text('Route 1', style: TextStyle(color: Colors.white)),
            ),
            const ListTile(
              title: Text('Next Stop', style: TextStyle(color: Colors.white70)),
              subtitle:
                  Text('Building 57', style: TextStyle(color: Colors.white)),
            ),
            const Divider(color: Colors.white24),
            ElevatedButton.icon(
              onPressed: _toggleTrip,
              icon: Icon(isTripStarted ? Icons.stop : Icons.play_arrow),
              label: Text(isTripStarted ? 'End Trip' : 'Start Trip'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isTripStarted ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _toggleLocation,
              icon: Icon(
                  isSharingLocation ? Icons.location_off : Icons.location_on),
              label: Text(isSharingLocation
                  ? 'Stop Sharing Location'
                  : 'Share Live Location'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSharingLocation ? Colors.grey : Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _showEmergencyDialog,
              icon: const Icon(Icons.warning),
              label: const Text('Emergency'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
            const SizedBox(height: 24),
            if (isSharingLocation) ...[
              const Divider(color: Colors.white38),
              const Text('Live Map',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 400,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: currentBusLocation,
                    initialZoom: 15.5,
                    keepAlive: true,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                      userAgentPackageName: 'com.example.app',
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: [currentBusLocation, nextStationLocation],
                          strokeWidth: 4,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: currentBusLocation,
                          width: 40,
                          height: 40,
                          child: const Icon(Icons.directions_bus,
                              color: Colors.green, size: 40),
                        ),
                        Marker(
                          point: nextStationLocation,
                          width: 40,
                          height: 40,
                          child: const Icon(Icons.flag,
                              color: Colors.blue, size: 40),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
