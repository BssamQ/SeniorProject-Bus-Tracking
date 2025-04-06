import 'package:flutter/material.dart';

import 'admin_dashboard.dart';

class AdminMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            isDarkMode ? Colors.black : Colors.white, // Adjust AppBar color
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: isDarkMode
                  ? Colors.white
                  : Colors.black), // Adjust icon color
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/ar/archive/3/37/20221103091849%21King_Fahd_University_of_Petroleum_%26_Minerals_Logo.png',
              height: 60,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.school, size: 60);
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person,
                color: isDarkMode
                    ? Colors.white
                    : Colors.black), // Adjust icon color
            onPressed: () async {
              await Navigator.pushNamed(context, '/preferences');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Admin Dashboard",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black, // Adjust text color
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildAdminOption(
                    context,
                    icon: Icons.directions_bus,
                    title: "Bus Management",
                    onTap: () =>
                        Navigator.pushNamed(context, '/bus_management'),
                    isDarkMode: isDarkMode,
                  ),
                  _buildAdminOption(
                    context,
                    icon: Icons.person,
                    title: "Driver Management",
                    onTap: () =>
                        Navigator.pushNamed(context, '/driver_management'),
                    isDarkMode: isDarkMode,
                  ),
                  _buildAdminOption(
                    context,
                    icon: Icons.map,
                    title: "Route Management",
                    onTap: () =>
                        Navigator.pushNamed(context, '/route_management'),
                    isDarkMode: isDarkMode,
                  ),
                  _buildAdminOption(
                    context,
                    icon: Icons.dashboard,
                    title: "Dashboard",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminDashboardScreen(),
                      ),
                    ),
                    isDarkMode: isDarkMode,
                  ), // The 4th button to navigate to AdminDashboard
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    // Adjust box color based on the theme
    Color boxColor = isDarkMode ? Colors.grey[800]! : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 1),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.green),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
