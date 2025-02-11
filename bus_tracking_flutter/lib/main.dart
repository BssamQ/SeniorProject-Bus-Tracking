import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'Screens/login_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/preferences_screen.dart';
import 'Screens/select_bus_screen.dart';
import 'Screens/waiting_for_bus_screen.dart';
import 'Screens/on_bus_screen.dart';
import 'Screens/list_station_screen.dart';
import 'Screens/select_route_screen.dart';

late SessionManager sessionManager;

late Client client;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  // The android emulator does not have access to the localhost of the machine.
  // const ipAddress = '10.0.2.2'; // Android emulator ip for the host

  // On a real device replace the ipAddress with the IP address of your computer.
  const ipAddress = '10.0.2.2';

  // Sets up a singleton client object that can be used to talk to the server from
  // anywhere in our app. The client is generated from your server code.
  // The client is set up to connect to a Serverpod running on a local server on
  // the default port. You will need to modify this to connect to staging or
  // production servers.
  client = Client(
    'http://$ipAddress:8080/', // Using the dynamic IP address
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

 /* client = Client(
    'http://localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();*/
  // The session manager keeps track of the signed-in state of the user. You
  // can query it to see if the user is currently signed in and get information
  // about the user.
  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();


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
