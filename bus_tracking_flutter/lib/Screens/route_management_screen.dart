import 'package:flutter/material.dart';

class RouteManagementScreen extends StatefulWidget {
  @override
  _RouteManagementScreenState createState() => _RouteManagementScreenState();
}

class _RouteManagementScreenState extends State<RouteManagementScreen> {
  List<Map<String, dynamic>> routes = [
    {"id": "1", "name": "Route A", "start": "Station 1", "end": "Station 5"},
    {"id": "2", "name": "Route B", "start": "Station 2", "end": "Station 8"},
  ];

  void _addRoute() {
    setState(() {
      routes.add({"id": "NEW", "name": "New Route", "start": "Select Start", "end": "Select End"});
    });
  }

  void _deleteRoute(int index) {
    setState(() {
      routes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Management"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text("Route: ${routes[index]['name']}"),
                      subtitle: Text("From: ${routes[index]['start']} → To: ${routes[index]['end']}"),
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
                            onPressed: () => _deleteRoute(index),
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
              onPressed: _addRoute,
              child: Text("Add New Route"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
