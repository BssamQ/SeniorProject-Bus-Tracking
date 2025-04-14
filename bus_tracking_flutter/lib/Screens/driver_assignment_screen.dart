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

  void _showCreateDriverDialog() async {
    String? name;
    String? email;
    String? password;
    int? selectedBusId;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Create New Driver'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Name'),
                    onChanged: (val) => name = val,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (val) => email = val,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onChanged: (val) => password = val,
                  ),
                  DropdownButtonFormField<int>(
                    value: selectedBusId,
                    hint: Text("Select Bus"),
                    items: availableBuses.map((bus) {
                      return DropdownMenuItem<int>(
                        value: bus.id,
                        child: Text("Bus ${bus.busNumber}"),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedBusId = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (name != null && email != null && password != null && selectedBusId != null) {
                    try {
                      final userInfoId = await widget.client.user.createUserWithDriverRole(
                        name: name!,
                        email: email!,
                        password: password!,
                      );

                      if (userInfoId == null) throw Exception("User creation failed");

                      await widget.client.driverInfo.createDriver(
                        DriverInfo(
                          userInfoId: userInfoId,
                          busId: selectedBusId!,
                        ),
                      );
                      final bus = await widget.client.bus.getBusById(selectedBusId!);
                      if (bus != null) {
                        bus.driverName = name!;
                        await widget.client.bus.updateBus(bus);
                      }


                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Driver created and assigned successfully")),
                      );
                      _loadData(); // refresh list
                    } catch (e) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: $e")),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill in all fields")),
                    );
                  }
                },
                child: Text('Create'),
              )

            ],
          );
        });
      },
    );
  }


  void _assignDriver() async {
    if (selectedUser == null || selectedBus == null) return;

    final user = selectedUser!;
    final bus = selectedBus!;

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
            FutureBuilder<String?>(
              future: bus.routeID != null ? _fetchRouteName(bus.routeID!) : Future.value(null),
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
      await widget.client.user.updateUserRole(user.userInfoId, 'Driver');

      // Create driver record
      final driverInfo = DriverInfo(userInfoId: user.userInfoId, busId: bus.id!);
      await widget.client.driverInfo.createDriver(driverInfo);

      // Update bus with new driver name
      final updatedBus = bus.copyWith(driverName: userNames[user.userInfoId] ?? 'Unknown');
      final success = await widget.client.bus.updateBus(updatedBus);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Driver assigned and bus updated successfully')),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Driver assigned, but failed to update bus')),
        );
      }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.check),
                  label: Text("Assign Driver"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: _assignDriver,
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.person_add),
                  label: Text("New Driver Account"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: _showCreateDriverDialog,
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
