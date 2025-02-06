import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/kfupm_logo1.png', height: 60),
            SizedBox(width: 9),
            Text('BUS SYSTEM', style: TextStyle(color: Colors.black,fontSize: 20,
              fontWeight: FontWeight.bold,)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preferences',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 10),
              _buildProfileSection(),
              SizedBox(height: 20),
              _buildPreferenceOptions(),
            ],
          ),
        ),
      ),


    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.account_circle, size: 50),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ahmed Mohammed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Student', style: TextStyle(color: Colors.grey)),
            ],
          ),
          Spacer(),
          Icon(Icons.edit, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildPreferenceOptions() {
    return Column(
      children: [
        _buildSwitchTile('Theme', 'Light', Icons.light_mode, true),
        _buildListTile('Default Destination', 'Station 828', Icons.location_on, () {}),
        Divider(),
        _buildButtonTile('Clear Cache', 'Clear', Icons.delete, Colors.green, () {}),
        _buildButtonTile('Privacy Policy', 'Link', Icons.privacy_tip, Colors.green, () {}),
        Divider(),
        _buildButtonTile('Help Center', 'Contact US', Icons.help, Colors.green, () {}),
        Divider(),
        _buildListTile('App Version', '1.0', Icons.info, null),
      ],
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, IconData icon, bool value) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      secondary: Icon(icon),
      value: value,
      onChanged: (bool newValue) {},
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon, VoidCallback? onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: onTap != null ? Icon(Icons.arrow_forward_ios, size: 16) : null,
      onTap: onTap,
    );
  }

  Widget _buildButtonTile(String title, String buttonText, IconData icon, Color buttonColor, VoidCallback onPressed) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: Text(buttonText, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
