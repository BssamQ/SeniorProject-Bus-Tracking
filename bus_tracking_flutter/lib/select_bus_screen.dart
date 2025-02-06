import 'package:flutter/material.dart';

class SelectBusScreen extends StatefulWidget {
  @override
  _SelectBusScreenState createState() => _SelectBusScreenState();
}

class _SelectBusScreenState extends State<SelectBusScreen> {
  String? selectedBus;

  void _showBusInfo(String busName) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bus Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              _buildBusInfoTile('Bus A', 'Station 13 - Station 15 - Station 21'),
              _buildBusInfoTile('Bus B', 'Station 16 - Station 17'),
              _buildBusInfoTile('Bus C', 'Station 13 - Station 15 - Station 21 - Station 28'),
              _buildBusInfoTile('Bus G', 'Route details...'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBusInfoTile(String bus, String route) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(bus, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      title: Text(route),
    );
  }

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select bus', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildBusOption('Bus A'),
            _buildBusOption('Bus B'),
            _buildBusOption('Bus C'),
            _buildBusOption('Bus G'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedBus != null ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Select', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBusOption(String busName) {
    return ListTile(
      leading: Icon(Icons.directions_bus, color: Colors.amber, size: 40),
      title: Text(busName),
      trailing: IconButton(
        icon: Icon(Icons.info_outline, color: Colors.blue),
        onPressed: () => _showBusInfo(busName),
      ),
      tileColor: selectedBus == busName ? Colors.orangeAccent.withOpacity(0.5) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: () {
        setState(() {
          selectedBus = busName;
        });
      },
    );
  }
}
