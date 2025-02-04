import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SelectRouteScreen extends StatefulWidget {
  @override
  _SelectRouteScreenState createState() => _SelectRouteScreenState();
}

class _SelectRouteScreenState extends State<SelectRouteScreen> {
  String? pickupLocation;
  String? destinationLocation;
  bool showRoute = false;

  final List<String> locations = [
    "Building 22",
    "Building 824",
    "Station 22",
    "Station 23",
    "Station 25"
  ];

  final LatLng _pickupPosition = LatLng(26.3041, 50.1412); // Example coordinates
  final LatLng _destinationPosition = LatLng(26.3075, 50.1450); // Example coordinates

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
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: _pickupPosition,
                initialZoom: 16.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                if (showRoute)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [_pickupPosition, _destinationPosition],
                        color: Colors.blue,
                        strokeWidth: 4,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _pickupPosition,
                      width: 40,
                      height: 40,
                      child: Icon(Icons.location_pin, color: Colors.orange, size: 40),
                    ),
                    Marker(
                      point: _destinationPosition,
                      width: 40,
                      height: 40,
                      child: Icon(Icons.location_pin, color: Colors.blue, size: 40),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Route Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                _buildDropdown("Pickup", pickupLocation, (value) {
                  setState(() => pickupLocation = value);
                }),
                SizedBox(height: 10),
                _buildDropdown("Destination", destinationLocation, (value) {
                  setState(() => destinationLocation = value);
                }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (pickupLocation != null && destinationLocation != null)
                      ? () {
                    setState(() {
                      showRoute = true;
                    });
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Confirm", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String? selectedValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: locations.map((String location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.grey[200],
            filled: true,
          ),
        ),
      ],
    );
  }
}
