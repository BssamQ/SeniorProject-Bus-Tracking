import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LatLng _initialPosition = LatLng(26.3123370, 50.1422222);
  LatLng? _currentPostion = LatLng(26.3123370, 50.1422222);
  LatLng? pickupPosition;
  LatLng? destinationPosition;
  String? pickupLocation;
  String? destinationLocation;
  bool showRoute = false;

  void _updateRoute(Map<String, dynamic> selectedRoute) {
    setState(() {
      pickupLocation = selectedRoute['pickup'];
      destinationLocation = selectedRoute['destination'];
      pickupPosition = selectedRoute['pickupPosition'];
      destinationPosition = selectedRoute['destinationPosition'];
      showRoute = true;
    });
  }

  List<Marker> _getRouteMarkers() {
    List<Marker> markers = [];
    if (showRoute && pickupPosition != null && destinationPosition != null) {
      markers.addAll([
        Marker(
          point: pickupPosition!,
          width: 40,
          height: 40,
          child: Icon(Icons.location_on,
              color: const Color.fromARGB(255, 63, 244, 54), size: 40),
        ),
        Marker(
          point: destinationPosition!,
          width: 40,
          height: 40,
          child: Icon(Icons.location_on, color: Colors.red, size: 40),
        ),
      ]);
    }
    return markers;
  }

  List<Polyline> _getRoutePolylines() {
    if (showRoute && pickupPosition != null && destinationPosition != null) {
      return [
        Polyline(
          points: [pickupPosition!, destinationPosition!],
          color: const Color.fromARGB(255, 54, 244, 168),
          strokeWidth: 4.0,
        ),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Text('BUS SYSTEM',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Preferences'),
              onTap: () {
                Navigator.pushNamed(context, '/preferences');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: _initialPosition,
              initialZoom: 16.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: _getRoutePolylines(),
              ),
              MarkerLayer(markers: _getRouteMarkers()),
            ],
          ),
          if (showRoute)
            Positioned(
              bottom: 70,
              left: 16,
              right: 16,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('From: ${pickupLocation ?? ""}'),
                      Text('To: ${destinationLocation ?? ""}'),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/select_route').then((result) {
              if (result != null) {
                _updateRoute(result as Map<String, dynamic>);
              }
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions), label: 'Select Route'),
        ],
      ),
    );
  }
}
