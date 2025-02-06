import 'package:flutter/material.dart';

class ListStationScreen extends StatefulWidget {
  @override
  _ListStationScreenState createState() => _ListStationScreenState();
}

class _ListStationScreenState extends State<ListStationScreen> {
  String? selectedStation;

  final List<String> stations = [
    "Station 22",
    "Station 23",
    "Station 25",
    "Station 21",
    "Station 29"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Stations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: stations.length,
                itemBuilder: (context, index) {
                  String station = stations[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedStation = station;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: selectedStation == station ? Colors.orange[300] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.black),
                          SizedBox(width: 10),
                          Text(station, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedStation != null
                  ? () {
                Navigator.pop(context, selectedStation);
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Select", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
