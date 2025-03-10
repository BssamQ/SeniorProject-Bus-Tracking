import 'package:flutter/material.dart';
import 'package:AdminDash.dart';
import 'package:bus_tracking_flutter/Screens/bus_managment_screen.dart';
import 'package:bus_tracking_flutter/Screens/driver_management_screen.dart';
import 'package:bus_tracking_flutter/Screens/route_management_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      title: "Admin Dashboard",
      initialRoute: '/', // Set initial screen
      routes: {
        '/': (context) => AdminDashboardScreen(), // Main dashboard
        '/bus_management': (context) => BusManagementScreen(), // Bus management
        '/driver_management': (context) => DriverManagementScreen(),
        '/route_management': (context) => RouteManagementScreen(),
      },
    );
  }
}
