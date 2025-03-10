import 'package:flutter/material.dart';

class DriverManagementScreen extends StatefulWidget {
  @override
  _DriverManagementScreenState createState() => _DriverManagementScreenState();
}

class _DriverManagementScreenState extends State<DriverManagementScreen> {
  List<Map<String, dynamic>> drivers = [
    {"id": "1", "name": "Mohammed Ahmed", "assignedBus": "Bus 621"},
    {"id": "2", "name": "Abdullah Ali", "assignedBus": "Bus 623"},
  ];

  void _addDriver() {
    setState(() {
      drivers.add({"id": "NEW", "name": "New Driver", "assignedBus": "Unassigned"});
    });
  }

  void _deleteDriver(int index) {
    setState(() {
      drivers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Management"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: drivers.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text("Driver: ${drivers[index]['name']}"),
                      subtitle: Text("Assigned Bus: ${drivers[index]['assignedBus']}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // Navigate to edit screen (to be implemented later)
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteDriver(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addDriver,
              child: Text("Add New Driver"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
