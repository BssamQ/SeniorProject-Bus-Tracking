import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import '../main.dart'; // Ensure main.dart has sessionManager

class PreferencesScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const PreferencesScreen({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  late bool _isDarkMode;
  late TextEditingController _nameController;
  bool _isEditing = false;
  String _selectedStation = "Station 828";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _isDarkMode = widget.isDarkMode;
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    var userInfo = sessionManager.signedInUser;
    setState(() {
      _nameController.text = userInfo?.userName ?? "Guest";
    });
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    widget.onThemeChanged(value); // Notify main app
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preferences")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isDarkMode ? Colors.grey[800] : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 50, color: _isDarkMode ? Colors.white70 : Colors.black54),
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
                          style: TextStyle(
                            fontSize: 18,
                            color: _isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(_isEditing ? Icons.check : Icons.edit, color: _isDarkMode ? Colors.white : Colors.black),
                        onPressed: () {
                          setState(() {
                            _isEditing = !_isEditing; // Toggle editing state
                          });
                        },
                      ),
                    ],
                  ),
                  Text("Student", style: TextStyle(color: _isDarkMode ? Colors.white70 : Colors.grey[600])),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Default Destination"),
              subtitle: Text(_selectedStation),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: _selectStation,
            ),
            const Text("Theme Mode"),
            Switch(
              value: _isDarkMode,
              onChanged: _toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}
