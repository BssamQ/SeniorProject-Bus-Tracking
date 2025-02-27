import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  HomeScreen({required this.isDarkMode, required this.onThemeChanged});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LatLng _initialPosition = LatLng(26.3123370, 50.1422222);
  String username = "Guest";
  late bool _isDarkMode;
  LatLng? pickupPosition;
  LatLng? destinationPosition;
  bool showRoute = false;
  String? pickupLocation;
  String? destinationLocation;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _fetchUsername();
    _loadSavedRoute();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/ar/archive/3/37/20221103091849%21King_Fahd_University_of_Petroleum_%26_Minerals_Logo.png',
              height: 60,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.school, size: 60);
              },
            ),
            SizedBox(width: 9),
            Text(
              'BUS SYSTEM',
              style: TextStyle(
                color: _isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: _isDarkMode ? Colors.white : Colors.black),
            onPressed: () async {
              await Navigator.pushNamed(context, '/preferences');
              // Reload preferences after returning
              _loadPreferences();
            },
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: pickupPosition ?? _initialPosition,
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,
        selectedItemColor: _isDarkMode ? Colors.green : Colors.blue,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/select_route');
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.directions), label: 'Select Route'),
        ],
      ),
    );
  }
}
