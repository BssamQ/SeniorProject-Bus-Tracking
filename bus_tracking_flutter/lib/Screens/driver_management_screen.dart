import 'package:flutter/material.dart';
import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'driver_assignment_screen.dart';

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
        print("driver.userinfoId = ${driver.userInfoId}");
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
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DriverAssignmentScreen(client: client),
      ),
    );

    if (result == true) {
      _fetchDrivers(); // Refresh the driver list
    }
  }
  Future<String?> _fetchRouteName(int? routeId) async {
    try {
      return await widget.client.route.getRouteNameById(routeId!);
    } catch (e) {
      print('Error fetching route name: $e');
      return null;
    }
  }

  void _editDriver(DriverInfo driverInfo) async {
    // Fetch driver details from the server
    final driver = await widget.client.driverInfo.getDriverById(driverInfo.id!);
    final bus = await client.bus.getBusById(driver!.busId);

    // Fetch available buses
    final buses = await widget.client.bus.getAvailableOperatingBuses();

    // Get user info (username, email, created date)
    final userInfo = await widget.client.user.getUserName(driver.userInfoId);
    final email = await widget.client.user.getUserEmail(driver.userInfoId);
    final createdDate = await widget.client.user.getUserCreatedDate(driver.userInfoId);

    // Show the edit screen with the current driver details
    showDialog(
      context: context,
      builder: (context) {
        Bus? selectedBus;
        return AlertDialog(
          title: Text('Edit Driver'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display current details
                Text('Username: ${userInfo ?? 'Unknown'}'),
                Text('Email: ${email ?? 'Unknown'}'),
                Text('Account Created: ${createdDate ?? 'Unknown'}'),
                Text('Current Bus: ${bus?.busNumber ?? 'None'}'),
                FutureBuilder<String?>(
                  future: _fetchRouteName(bus!.routeID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading route...');
                    } else if (snapshot.hasError) {
                      return Text('Error fetching route');
                    } else if (snapshot.hasData) {
                      return Text('Current Route: ${snapshot.data ?? 'None'}');
                    } else {
                      return Text('No route available');
                    }
                  },
                ),
                SizedBox(height: 16),
                // Dropdown to select new bus
                DropdownButtonFormField<Bus>(
                  value: selectedBus,
                  hint: Text("Select New Bus"),
                  items: buses.map((bus) {
                    return DropdownMenuItem<Bus>(
                      value: bus,
                      child: Text('${bus.busNumber} '),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedBus = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text('Save Changes'),
              onPressed: () async {
                // ✅ Set old bus's driver name to "No Driver Assigned"
                final clearedOldBus = bus.copyWith(driverName: "No Driver Assigned");
                await widget.client.bus.updateBus(clearedOldBus);

                if (selectedBus != null) {
                  // ✅ Assign new driver name to selected bus
                  final updatedBus = selectedBus!.copyWith(driverName: userInfo ?? 'Unknown');
                  await widget.client.bus.updateBus(updatedBus);

                  // Update driver record
                  driver.busId = selectedBus!.id!;
                  await widget.client.driverInfo.updateDriver(driver);

                  // Close dialog and refresh list
                  Navigator.pop(context);
                  setState(() {
                    _fetchDrivers();
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Driver updated successfully')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a bus')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }



  void _deleteDriver(int driverId, int userId) async {
    try {
      bool success = await client.driverInfo.deleteDriver(driverId);
      if (success) {
        await client.user.updateUserRole(userId, "Student"); // <-- Await here!
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Driver removed'),
            duration: Duration(seconds: 2),
          ),
        );
        _fetchDrivers();
      }
      else {
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
        title: Text("Driver Management", style: TextStyle(
          color: Colors.white, // 👈 White text
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.green,
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
          final busNumber = driverBuses[driver.id!]?.busNumber ?? 'None';


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
                  _deleteDriver(driver.id!, driver.userInfoId);
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
        backgroundColor: Colors.green,
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
