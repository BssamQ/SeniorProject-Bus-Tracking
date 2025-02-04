import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'Screens/login_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/preferences_screen.dart';
import 'Screens/select_bus_screen.dart';
import 'Screens/waiting_for_bus_screen.dart';
import 'Screens/on_bus_screen.dart';
import 'Screens/list_station_screen.dart';
import 'Screens/select_route_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/preferences': (context) => PreferencesScreen(),
        '/select_bus': (context) => SelectBusScreen(),
        '/waiting_for_bus': (context) => WaitingForBusScreen(),
        '/on_bus': (context) => OnBusScreen(),
        '/list_station': (context) => ListStationScreen(),
        '/select_route': (context) => SelectRouteScreen(),
      },
    );
  }
}
