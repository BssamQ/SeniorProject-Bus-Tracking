import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final TextEditingController _nameController = TextEditingController(text: "Ahmed Mohammed");
  bool _isEditing = false; // Track if the user is editing

  bool _isDarkMode = false;
  String _selectedStation = "Station 828";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Preferences', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Section
            Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 50, color: Colors.black54),
                      SizedBox(width: 10),
                      Expanded(
                        child: _isEditing
                            ? TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                        )
                            : Text(
                          _nameController.text,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      IconButton(
                        icon: Icon(_isEditing ? Icons.check : Icons.edit, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            _isEditing = !_isEditing; // Toggle editing state
                          });
                        },
                      ),
                    ],
                  ),
                  Text("Student", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),

            SizedBox(height: 20),

            // User Preferences Section
            Text("User Preferences", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            // Theme Toggle
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text("Theme"),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                },
              ),
            ),

            // Default Destination Selection
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Default Destination"),
              subtitle: Text(_selectedStation),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                _selectStation();
              },
            ),

            SizedBox(height: 20),

            // Data & Privacy Section
            Text("Data and Privacy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.delete),
              title: Text("Clear Cache"),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Clear"),
              ),
            ),

            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text("Privacy Policy"),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Link"),
              ),
            ),

            SizedBox(height: 20),

            // Support Section
            Text("Support and Feedback", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),

            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help Center"),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Contact Us"),
              ),
            ),

            SizedBox(height: 20),

            // App Version
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("App Version"),
                  Text("1.0", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to select default station
  void _selectStation() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Select Default Destination", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                title: Text("Station 828"),
                onTap: () {
                  setState(() {
                    _selectedStation = "Station 828";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Station 19"),
                onTap: () {
                  setState(() {
                    _selectedStation = "Station 19";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Station 25"),
                onTap: () {
                  setState(() {
                    _selectedStation = "Station 25";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
