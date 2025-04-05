import 'package:flutter/material.dart';
import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class DriverManagementScreen extends StatefulWidget {
  final Client client;
  final SessionManager sessionManager;



  DriverManagementScreen({
    required this.client,
    required this.sessionManager,
  });

  @override
  _DriverManagementScreenState createState() => _DriverManagementScreenState();
}

class _DriverManagementScreenState extends State<DriverManagementScreen> {
  late Client client;
  late SessionManager sessionManager;
  List<DriverInfo> drivers = [];
  Map<int, String> driverNames = {};
  Map<int, Bus?> driverBuses = {};

  @override
  void initState() {
    super.initState();
    client = widget.client;
    sessionManager = widget.sessionManager;
    _fetchDrivers();
  }

  Future<void> _fetchDrivers() async {
    try {
      List<DriverInfo> driverList = await client.driverInfo.getAllDrivers();
      Map<int, String> names = {};
      Map<int, Bus?> buses = {};

      for (var driver in driverList) {
        final name = await client.driverInfo.getDriverName(driver.userInfoId) ?? 'Unknown';
        final bus = await client.driverInfo.getDriverBus(driver.id!);

        names[driver.id!] = name;
        buses[driver.id!] = bus;

      }

      setState(() {
        drivers = driverList;
        driverNames = names;
        driverBuses = buses;
      });
    } catch (e) {
      print('Error fetching drivers: $e');
    }
  }



  Future<String> getDriverName(int userInfoId) async {
    try {
      final name = await client.driverInfo.getDriverName(userInfoId);
      return name ?? 'Unknown';
    } catch (e) {
      print('Error fetching driver name: $e');
      return 'Unknown';
    }
  }

  void _addDriver() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DriverFormScreen(
          client: client,
          sessionManager: sessionManager,
        ),
      ),
    );
    _fetchDrivers();
  }

  void _editDriver(DriverInfo driver) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DriverFormScreen(
          client: client,
          sessionManager: sessionManager,
          driver: driver,
        ),
      ),
    );
    _fetchDrivers();
  }

  void _deleteDriver(int driverId) async {
    try {
      bool success = await client.driverInfo.deleteDriver(driverId);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Driver removed'),
            duration: Duration(seconds: 2),
          ),
        );
        _fetchDrivers();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to remove driver'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print('Error deleting driver: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting driver'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Management"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addDriver,
          ),
        ],
      ),
      body: drivers.isEmpty
          ? Center(
        child: Text(
          'No drivers available',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          var driver = drivers[index];
          final name = driverNames[driver.id!] ?? 'Unknown';
          print(driverNames[driver.id!]);
          final busNumber = driverBuses[driver.id!]?.busNumber ?? 'None';
          print(driverBuses[driver.id!]?.busNumber);

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text(
                name.isNotEmpty ? name[0] : '?',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Assigned Bus: $busNumber"),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  _editDriver(driver);
                } else if (value == 'delete') {
                  _deleteDriver(driver.id!);
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
            ),
            onTap: () {
              // Optionally, implement navigation to a detailed view of the driver
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addDriver,
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Bus?> getDriverBus(int driverInfoId) async {
    try {
      return await client.driverInfo.getDriverBus(driverInfoId);
    } catch (e) {
      print('Error fetching driver bus: $e');
      return null;
    }
  }
}

class DriverFormScreen extends StatelessWidget {
  final Client client;
  final SessionManager sessionManager;
  final DriverInfo? driver;

  DriverFormScreen({
    required this.client,
    required this.sessionManager,
    this.driver,
  });

  @override
  Widget build(BuildContext context) {
    // Implement the form to add or edit a driver
    // Use the driver parameter to pre-fill the form when editing
    return Scaffold(
      appBar: AppBar(
        title: Text(driver == null ? 'Add Driver' : 'Edit Driver'),
      ),
      body: Center(
        child: Text('Driver Form Goes Here'),
      ),
    );
  }
}
