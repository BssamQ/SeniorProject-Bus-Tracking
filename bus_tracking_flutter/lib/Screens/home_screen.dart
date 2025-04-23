import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const HomeScreen({super.key, required this.isDarkMode, required this.onThemeChanged});

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
      // appBar: AppBar(
      //   backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      //   elevation: 0,
      //   title: Row(
      //     children: [
      //       Image.network(
      //         'https://upload.wikimedia.org/wikipedia/ar/archive/3/37/20221103091849%21King_Fahd_University_of_Petroleum_%26_Minerals_Logo.png',
      //         height: 55,
      //         loadingBuilder: (context, child, loadingProgress) {
      //           if (loadingProgress == null) return child;
      //           return SizedBox(
      //             height: 60,
      //             width: 60,
      //             child: Center(
      //               child: CircularProgressIndicator(
      //                 value: loadingProgress.expectedTotalBytes != null
      //                     ? loadingProgress.cumulativeBytesLoaded /
      //                     loadingProgress.expectedTotalBytes!
      //                     : null,
      //               ),
      //             ),
      //           );
      //         },
      //         errorBuilder: (context, error, stackTrace) {
      //           return Icon(Icons.school, size: 60);
      //         },
      //       ),
      //       SizedBox(width: 9),
      //       Text(
      //         'BUS SYSTEM',
      //         style: TextStyle(
      //           color: _isDarkMode ? Colors.white : Colors.black,
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.person, color: _isDarkMode ? Colors.white : Colors.black),
      //       onPressed: () async {
      //         await Navigator.pushNamed(context, '/preferences');
      //         // Reload preferences after returning
      //         _loadPreferences();
      //       },
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [

          // Map behind
          FlutterMap(
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 25, // Standard status bar height (can adjust)
              decoration: BoxDecoration(
                color: widget.isDarkMode
                    ? Colors.black.withOpacity(0.5) // Dark mode: dark gray semi-transparent
                    : Colors.white.withOpacity(0.4), // Light mode: white semi-transparent
              ),
            ),
          ),
          // Transparent overlay behind status bar (clock, battery, etc.)

          // Top Bar Overlay
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  ),
                ),

                // Title with Logo
                Row(
                  mainAxisSize: MainAxisSize.min,
                  // children: [
                  //   Image.network(
                  //     'https://upload.wikimedia.org/wikipedia/ar/archive/3/37/20221103091849%21King_Fahd_University_of_Petroleum_%26_Minerals_Logo.png',
                  //     height: 35,
                  //   ),
                  //   const SizedBox(width: 8),
                  //   const Text(
                  //     'BUS SYSTEM',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 16,
                  //     ),
                  //   ),
                  // ],
                ),

                // Person Icon
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.pushNamed(context, '/preferences');
                      _loadPreferences();
                    },
                    child: Icon(Icons.person, color: Colors.white, size: 28),
                  ),
                ),
              ],
            ),
          ),



          // Floating Buttons
          Positioned(
            left: 16,
            right: 16,
            bottom: 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showRoute && pickupLocation != null && destinationLocation != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Route: $pickupLocation → $destinationLocation',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Explorer',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isDarkMode ? Colors.black : Color(0xFF008540),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/select_route');
                    },
                    child: Text(
                      'Select Route',
                      style: _isDarkMode
                          ? const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF008540))
                          : const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
