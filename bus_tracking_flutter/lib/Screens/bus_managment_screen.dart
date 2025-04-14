import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:flutter/material.dart';
import '../main.dart'; // Import main.dart to access the client

class BusManagementScreen extends StatefulWidget {
  const BusManagementScreen({super.key});

  @override
  _BusManagementScreen createState() => _BusManagementScreen();
}

class _BusManagementScreen extends State<BusManagementScreen> {
  List<Bus> buses = [];
  List<Routes> routes = [];
  String _selectedStatus = "Operating";
  String? _selectedRoute;
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _breakdownController = TextEditingController();

  Future<void> _loadBuses() async {
    try {
      final fetchedBuses = await client.bus.getAllBuses();
      setState(() {
        buses = fetchedBuses;
      });
    } catch (e) {
      print("Error loading buses: $e");
    }
  }

  Future<void> _loadRoutes() async {
    try {
      final fetchedRoutes = await client.route.getAllRoutes();
      setState(() {
        routes = fetchedRoutes.cast<Routes>();
      });
    } catch (e) {
      print("Error loading routes: $e");
    }
  }

  Future<void> _addBus() async {
    final bus = Bus(
      busNumber: _busNumberController.text,
      driverName: "No Driver Assigned",
      age: int.tryParse(_ageController.text) ?? 0,
      breakdownCounter: int.tryParse(_breakdownController.text) ?? 0,
      status: _selectedStatus,
      routeID: _selectedRoute != null ? int.tryParse(_selectedRoute!) : null,
    );
    try {
      final success = await client.bus.addBus(bus);
      if (success) {
        _loadBuses();
        Navigator.pop(context);
      } else {
        print("Failed to add bus");
      }
    } catch (e) {
      print("Error adding bus: $e");
    }
  }

  Future<void> _deleteBus(int busId) async {
    try {
      final success = await client.bus.deleteBus(busId);
      if (success) {
        _loadBuses();
      } else {
        print("Failed to delete bus");
      }
    } catch (e) {
      print("Error deleting bus: $e");
    }
  }

  Future<void> _updateBus(Bus bus) async {
    try {
      final success = await client.bus.updateBus(bus);
      if (success) {
        _loadBuses();
      } else {
        print("Failed to update bus");
      }
    } catch (e) {
      print("Error updating bus: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadBuses();
    _loadRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Management"),
        backgroundColor: Colors.green, // Set the AppBar color to green
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: buses.length,
              itemBuilder: (context, index) {
                final bus = buses[index];
                // Define color based on status
                Color cardColor;
                switch (bus.status) {
                  case "Operating":
                    cardColor = Colors.green[50]!; // Light green
                    break;
                  case "In Maintenance":
                    cardColor = Colors.orange[50]!; // Light orange
                    break;
                  case "Out of Service":
                    cardColor = Colors.red[50]!; // Light red
                    break;
                  default:
                    cardColor = Colors.grey[200]!; // Light grey as fallback
                }
                return Card(
                  color: cardColor,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text(
                      bus.busNumber,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Driver: ${bus.driverName}",
                            style: TextStyle(color: Colors.blue)),
                        Text("Age: ${bus.age}",
                            style: TextStyle(color: Colors.orange)),
                        Text("Breakdowns: ${bus.breakdownCounter}",
                            style: TextStyle(color: Colors.red)),
                        Text(
                          "Status: ${bus.status}",
                          style: TextStyle(
                            color: bus.status == "Operating"
                                ? Colors.green
                                : bus.status == "In Maintenance"
                                ? Colors.orange
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showEditBusDialog(bus),
                          tooltip: 'Edit Bus',
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteBus(bus.id!),
                          tooltip: 'Delete Bus',
                        ),
                      ],
                    ),
                    onTap: () => _showBusDetailsDialog(bus),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _showAddBusDialog,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              backgroundColor: Colors.green[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 8),
                Text("Add Bus",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showBusDetailsDialog(Bus bus) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Bus Details"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bus Number: ${bus.busNumber}",
                    style: TextStyle(fontSize: 16, color: Colors.green)),
                SizedBox(height: 10),
                Text("Driver Name: ${bus.driverName}",
                    style: TextStyle(fontSize: 16, color: Colors.blue)),
                SizedBox(height: 10),
                Text("Age: ${bus.age}",
                    style: TextStyle(fontSize: 16, color: Colors.orange)),
                SizedBox(height: 10),
                Text("Breakdown Count: ${bus.breakdownCounter}",
                    style: TextStyle(fontSize: 16, color: Colors.red)),
                SizedBox(height: 10),
                Text("Status: ${bus.status}",
                    style: TextStyle(
                        fontSize: 16,
                        color: bus.status == "Operating"
                            ? Colors.green
                            : Colors.grey)),
                SizedBox(height: 10),
                Text(
                    "Route: ${bus.routeID != null ? 'Route ${bus.routeID}' : 'Not assigned'}",
                    style: TextStyle(fontSize: 16, color: Colors.blue)),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Close")),
          ],
        );
      },
    );
  }

  void _showAddBusDialog() {
    // Clear any existing data in the fields when the dialog is shown
    _busNumberController.clear();
    _driverNameController.clear();
    _ageController.clear();
    _breakdownController.clear();
    _selectedRoute = null; // Reset route selection
    _selectedStatus = "Operating"; // Reset status to default

    // Ensure routes are loaded before showing the dialog
    if (routes.isEmpty) {
      _loadRoutes().then((_) {
        showDialog(
          context: context,
          builder: (context) => _buildAddBusDialog(),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => _buildAddBusDialog(),
      );
    }
  }

  void _showEditBusDialog(Bus bus) {
    _busNumberController.text = bus.busNumber;
    _driverNameController.text = bus.driverName;
    _ageController.text = bus.age.toString();
    _breakdownController.text = bus.breakdownCounter.toString();
    _selectedRoute = bus.routeID?.toString();
    _selectedStatus = bus.status;

    // Ensure routes are loaded before showing the dialog
    if (routes.isEmpty) {
      _loadRoutes().then((_) {
        showDialog(
          context: context,
          builder: (context) => _buildEditBusDialog(bus),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => _buildEditBusDialog(bus),
      );
    }
  }

  Widget _buildAddBusDialog() {
    List<Map<String, dynamic>> busStatuses = [
      {"status": "Operating", "color": Colors.green, "icon": Icons.play_arrow},
      {"status": "In Maintenance", "color": Colors.orange, "icon": Icons.build},
      {"status": "Out of Service", "color": Colors.red, "icon": Icons.cancel},
    ];

    return AlertDialog(
      title: Text("Add New Bus"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bus Number:"),
            TextField(controller: _busNumberController),
            SizedBox(height: 10),
            // Removed: Driver Name input
            Text("Age:"),
            TextField(controller: _ageController),
            SizedBox(height: 10),
            Text("Breakdown Count:"),
            TextField(controller: _breakdownController),
            SizedBox(height: 10),
            // Removed: Route dropdown
            Text("Status:"),
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              onChanged: (newStatus) {
                setState(() {
                  _selectedStatus = newStatus!;
                });
              },
              items: busStatuses.map((statusItem) {
                return DropdownMenuItem<String>(
                  value: statusItem["status"],
                  child: Row(
                    children: [
                      Icon(statusItem["icon"], color: statusItem["color"]),
                      SizedBox(width: 10),
                      Text(statusItem["status"]),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: _addBus, child: Text("Add")),
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
      ],
    );
  }


  Widget _buildEditBusDialog(Bus bus) {
    List<Map<String, dynamic>> busStatuses = [
      {"status": "Operating", "color": Colors.green, "icon": Icons.play_arrow},
      {"status": "In Maintenance", "color": Colors.orange, "icon": Icons.build},
      {"status": "Out of Service", "color": Colors.red, "icon": Icons.cancel},
    ];

    return AlertDialog(
      title: Text("Edit Bus"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bus Number:", style: TextStyle(color: Colors.green)),
            TextField(controller: _busNumberController),
            SizedBox(height: 10),
            // Removed: Driver Name
            Text("Age:", style: TextStyle(color: Colors.orange)),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Text("Breakdown Count:", style: TextStyle(color: Colors.red)),
            TextField(
              controller: _breakdownController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            // Removed: Route selection
            Text("Status:", style: TextStyle(color: Colors.teal)),
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              onChanged: (newStatus) {
                setState(() {
                  _selectedStatus = newStatus!;
                });
              },
              items: busStatuses.map((statusItem) {
                return DropdownMenuItem<String>(
                  value: statusItem["status"],
                  child: Row(
                    children: [
                      Icon(statusItem["icon"], color: statusItem["color"]),
                      SizedBox(width: 10),
                      Text(statusItem["status"]),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final updatedBus = bus.copyWith(
              busNumber: _busNumberController.text,
              // driverName omitted
              age: int.tryParse(_ageController.text) ?? 0,
              breakdownCounter: int.tryParse(_breakdownController.text) ?? 0,
              status: _selectedStatus,
              // routeID omitted
            );
            await _updateBus(updatedBus);
            Navigator.pop(context);
          },
          child: Text("Update"),
        ),
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel")),
      ],
    );
  }
}