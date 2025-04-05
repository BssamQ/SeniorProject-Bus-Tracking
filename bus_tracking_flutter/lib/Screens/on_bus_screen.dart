import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OnBusScreen extends StatelessWidget {
  final LatLng currentBusLocation = LatLng(26.3055, 50.1425);
  final LatLng nextStationLocation = LatLng(26.3070, 50.1450);

  OnBusScreen({super.key});

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
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: currentBusLocation,
              initialZoom: 15.5,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [currentBusLocation, nextStationLocation],
                    strokeWidth: 4,
                    color: Colors.red,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: currentBusLocation,
                    width: 40,
                    height: 40,
                    child: Icon(Icons.directions_bus, color: Colors.green, size: 40),
                  ),
                  Marker(
                    point: nextStationLocation,
                    width: 40,
                    height: 40,
                    child: Icon(Icons.location_on, color: Colors.blue, size: 40),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Next Station", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  SizedBox(height: 5),
                  Text(
                    "Station 15",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      text: "Estimated arrival in ",
                      style: TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: "7 min",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Type", style: TextStyle(color: Colors.grey, fontSize: 14)),
                          Text("Bus A", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Driver Name", style: TextStyle(color: Colors.grey, fontSize: 14)),
                          Text("Mohammed Ahmed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Passengers", style: TextStyle(color: Colors.grey, fontSize: 14)),
                          Text("14", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
