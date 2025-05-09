import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class PreferencesScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const PreferencesScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  late bool _isDarkMode;
  late TextEditingController _nameController;
  bool _isEditing = false;
  String _selectedStation = "Station 828";
  List<Station> _stations = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _isDarkMode = widget.isDarkMode;
    _fetchUsername();
    _fetchStations();
    _loadSelectedStation();
  }

  Future<void> _fetchUsername() async {
    var userInfo = sessionManager.signedInUser;
    setState(() {
      _nameController.text = userInfo?.userName ?? "Guest";
    });
  }

  Future<void> _fetchStations() async {
    try {
      var stations = await client.station.getAllStations();
      setState(() {
        _stations = stations;
      });
    } catch (e) {
      // Handle error (e.g., show a snackbar)
      print('Error fetching stations: $e');
    }
  }

  Future<void> _loadSelectedStation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedStation = prefs.getString('selectedStation') ?? "Station 828";
    });
  }

  Future<void> _saveSelectedStation(String stationName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedStation', stationName);
  }

  void _showChangePasswordDialog() {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Change Password"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Current Password'),
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final success = await _changePassword(
                oldPasswordController.text,
                newPasswordController.text,
              );
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(success
                      ? 'Password changed successfully'
                      : 'Failed to change password'),
                ),
              );
            },
            child: Text("Change"),
          ),
        ],
      ),
    );
  }
  Future<bool> _changePassword(String oldPassword, String newPassword) async {
    try {
      // Using positional parameters instead of named parameters
      final result = await client.modules.auth.email.changePassword(
          oldPassword,
          newPassword
      );
      return result;
    } catch (e) {
      print("Error changing password: $e");
      return false;
    }
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Select Default Destination", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ..._stations.map((station) {
                  return ListTile(
                    title: Text(station.name),
                    onTap: () {
                      setState(() {
                        _selectedStation = station.name;
                      });
                      _saveSelectedStation(station.name); // Save the selected station
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
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
                      SizedBox(
                        width: 150, // Makes the button full width
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.lock),
                          label: Text("Change Password"),
                          onPressed: _showChangePasswordDialog,
                        ),
                      ),
                      /*IconButton(
                        icon: Icon(_isEditing ? Icons.check : Icons.edit, color: _isDarkMode ? Colors.white : Colors.black),
                        onPressed: () {
                          setState(() {
                            _isEditing = !_isEditing; // Toggle editing state
                          });
                        },
                      ),*/



                    ],
                  ),
                  FutureBuilder<String?>(
                    future: client.user.getUserRole(), // async call
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading...", style: TextStyle(color: _isDarkMode ? Colors.white70 : Colors.grey[600]));
                      } else if (snapshot.hasError) {
                        return Text("Error loading role", style: TextStyle(color: Colors.red));
                      } else {
                        final role = snapshot.data ?? "Unknown";
                        return Text(role, style: TextStyle(color: _isDarkMode ? Colors.white70 : Colors.grey[600]));
                      }
                    },
                  )
                  ,
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

