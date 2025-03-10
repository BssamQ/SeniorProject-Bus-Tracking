import 'package:flutter/material.dart';

class BusManagementScreen extends StatefulWidget {
  @override
  _BusManagementScreenState createState() => _BusManagementScreenState();
}

class _BusManagementScreenState extends State<BusManagementScreen> {
  List<Map<String, dynamic>> buses = [
    {"id": "621", "type": "Mini", "capacity": 30, "route": "Route A"},
    {"id": "623", "type": "Large", "capacity": 50, "route": "Route B"},
  ];

  void _addBus() {
    setState(() {
      buses.add({"id": "NEW", "type": "New Type", "capacity": 40, "route": "New Route"});
    });
  }

  void _deleteBus(int index) {
    setState(() {
      buses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Management"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: buses.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text("Bus ID: ${buses[index]['id']}"),
                      subtitle: Text("Type: ${buses[index]['type']} - Route: ${buses[index]['route']}"),
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
                            onPressed: () => _deleteBus(index),
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
              onPressed: _addBus,
              child: Text("Add New Bus"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
