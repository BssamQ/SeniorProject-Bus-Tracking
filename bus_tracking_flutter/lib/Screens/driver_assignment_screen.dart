import 'package:flutter/material.dart';
import 'package:bus_tracking_client/bus_tracking_client.dart';

class DriverAssignmentScreen extends StatefulWidget {
  final Client client;

  DriverAssignmentScreen({required this.client});

  @override
  _DriverAssignmentScreenState createState() => _DriverAssignmentScreenState();
}

class _DriverAssignmentScreenState extends State<DriverAssignmentScreen> {
  List<User> nonDriverUsers = [];
  List<Bus> availableBuses = [];
  String routeName = "";
  Map<int, String> userNames = {};


  User? selectedUser;
  Bus? selectedBus;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final users = await widget.client.user.getNonDriverUsers();
    final buses = await widget.client.bus.getAvailableOperatingBuses();
    Map<int, String> fetchedNames = {};
    for (var user in users) {

        final name = await widget.client.user.getUserName(user.userInfoId);
        if (name != null) {
          fetchedNames[user.userInfoId] = name;
        }
    }
    setState(() {
      nonDriverUsers = users;
      availableBuses = buses;
      userNames = fetchedNames;
    });
  }

  // Function to fetch the route name using the bus's route ID
  Future<String?> _fetchRouteName(int routeId) async {
    try {
      return await widget.client.route.getRouteNameById(routeId);
    } catch (e) {
      print('Error fetching route name: $e');
      return null;
    }
  }

  void _assignDriver() async {
    if (selectedUser == null || selectedBus == null) return;

    final user = selectedUser!;
    final bus = selectedBus!;

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Confirm Assignment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("👤 User: ${userNames[user.userInfoId] ?? 'Unknown'}"),
            Text("🚌 Bus: ${bus.busNumber}"),
            // Display the route name by fetching it
            FutureBuilder<String?>(
              future: bus.routeID != null ? _fetchRouteName(bus.routeID!) : Future.value(null), // Only call if routeId is not null
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("📍 Route: Loading...");
                } else if (snapshot.hasError) {
                  return Text("📍 Route: Error loading route name");
                } else {
                  return Text("📍 Route: ${snapshot.data ?? 'Unknown Route'}");
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(
            child: Text('Confirm'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      // Assign driver role to user
      await widget.client.user.updateUserRole(user.id!, 'Driver');

      // Create driver record
      final driverInfo = DriverInfo(userInfoId: user.id!, busId: bus.id!);
      await widget.client.driverInfo.createDriver(driverInfo);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Driver assigned successfully')),
      );
      Navigator.pop(context, true); // return success to previous screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error assigning driver: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assign Driver")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<User>(
              value: selectedUser,
              hint: Text("Select User"),
              items: nonDriverUsers.map((user) {
                final name = userNames[user.userInfoId] ?? 'Unknown';
                return DropdownMenuItem<User>(
                  value: user,
                  child: Text(name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedUser = value;
                });
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<Bus>(
              value: selectedBus,
              hint: Text("Select Bus"),
              items: availableBuses.map((bus) {
                return DropdownMenuItem<Bus>(
                  value: bus,
                  child: Text('${bus.busNumber} - $routeName'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBus = value;
                });
              },
            ),
            SizedBox(height: 32),
            ElevatedButton.icon(
              icon: Icon(Icons.check),
              label: Text("Assign Driver"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: _assignDriver,
            ),
          ],
        ),
      ),
    );
  }
}
