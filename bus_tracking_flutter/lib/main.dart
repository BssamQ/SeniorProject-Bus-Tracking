import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'home_screen.dart';
import 'login_screen.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
const ipAddress = 'localhost';

var client = Client(
'http://$ipAddress:8080/',
authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();

final sessionManger = SessionManager(caller: client.modules.auth);

void main() async {
  print(client.modules.auth);
  WidgetsFlutterBinding.ensureInitialized();
  await sessionManger.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KFUPM Bus Tracking System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  @override
  void initState(){
    super.initState();

    sessionManger.addListener((){
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return switch (sessionManger.isSignedIn){
      true => HomeScreen(),
      false => LoginScreen(),
    };
  }
}
