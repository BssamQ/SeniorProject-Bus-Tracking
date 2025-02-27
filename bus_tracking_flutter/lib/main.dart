import 'package:flutter/material.dart';
import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/login_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/preferences_screen.dart';
import 'Screens/select_bus_screen.dart';
import 'Screens/waiting_for_bus_screen.dart';
import 'Screens/on_bus_screen.dart';
import 'Screens/list_station_screen.dart';
import 'Screens/select_route_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

late SessionManager sessionManager;
late Client client;
SharedPreferences? prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  const ipAddress = '10.0.2.2';
  client = Client(
    'http://$ipAddress:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    final savedTheme = prefs?.getBool('darkMode') ?? false;
    setState(() {
      _isDarkMode = savedTheme;
    });
  }

  void _toggleTheme(bool isDark) async {
    await prefs?.setBool('darkMode', isDark);
    setState(() {
      _isDarkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(isDarkMode: _isDarkMode, onThemeChanged: _toggleTheme),
        '/preferences': (context) => PreferencesScreen(isDarkMode: _isDarkMode, onThemeChanged: _toggleTheme),
        '/select_bus': (context) => SelectBusScreen(),
        '/waiting_for_bus': (context) => WaitingForBusScreen(),
        '/on_bus': (context) => OnBusScreen(),
        '/list_station': (context) => ListStationScreen(),
        '/select_route': (context) => SelectRouteScreen(isDarkMode: _isDarkMode, onThemeChanged: _toggleTheme),
      },
    );
  }
}
