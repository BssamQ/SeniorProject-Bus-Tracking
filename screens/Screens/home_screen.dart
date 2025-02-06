import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../Screens/preferences_screen.dart';
import '../Screens/select_bus_screen.dart';
import '../Screens/login_screen.dart';
import '../Screens/list_station_screen.dart';

class HomeScreen extends StatelessWidget {
  final LatLng _initialPosition = LatLng(26.3041, 50.1412); // KFUPM Location

  List<Marker> _busMarkers(BuildContext context) {
    return [
      Marker(
        point: LatLng(26.3050, 50.1420),
        width: 40,
        height: 40,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/select_bus'),
          child: Icon(Icons.directions_bus, color: Colors.green, size: 40),
        ),
      ),
      Marker(
        point: LatLng(26.3060, 50.1430),
        width: 40,
        height: 40,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/select_bus'),
          child: Icon(Icons.directions_bus, color: Colors.green, size: 40),
        ),
      ),
    ];
  }

  List<Marker> _stationMarkers(BuildContext context) {
    return [
      Marker(
        point: LatLng(26.3045, 50.1415),
        width: 40,
        height: 40,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/list_station'),
          child: Icon(Icons.location_pin, color: Colors.blue, size: 40),
        ),
      ),
      Marker(
        point: LatLng(26.3035, 50.1405),
        width: 40,
        height: 40,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/list_station'),
          child: Icon(Icons.location_pin, color: Colors.blue, size: 40),
        ),
      ),
    ];
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
            Image.asset('assets/images/kfupm_logo1.png', height: 60),
            SizedBox(width: 9),
            Text('BUS SYSTEM', style: TextStyle(color: Colors.black,fontSize: 20,
              fontWeight: FontWeight.bold,)),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
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
      body: FlutterMap(
        options: MapOptions(
          initialCenter: _initialPosition,
          initialZoom: 16.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(markers: _busMarkers(context) + _stationMarkers(context)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.directions), label: 'Select Route'),
        ],
      ),
    );
  }
}
