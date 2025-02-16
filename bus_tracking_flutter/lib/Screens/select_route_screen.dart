import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart'; // To save selected route

class SelectRouteScreen extends StatefulWidget {
  @override
  _SelectRouteScreenState createState() => _SelectRouteScreenState();
}

class _SelectRouteScreenState extends State<SelectRouteScreen> {
  String? pickupLocation;
  String? destinationLocation;
  bool showRoute = false;
  LatLng? pickupPosition;
  LatLng? destinationPosition;

  final Map<String, LatLng> locationCoordinates = {
    "Bus Stop 1 (Building 842)": LatLng(26.3148672, 50.1466890),
    "Bus Stop 2 (Building 843)": LatLng(26.3145661, 50.1452127),
    "Bus Stop 3 (Old Lines)": LatLng(26.3140771, 50.1433836),
    "Bus Stop 4 (Building 820)": LatLng(26.3128896, 50.1402611),
    "Bus Stop 5 (Building 63)": LatLng(26.3123370, 50.1422222),
    "Bus Stop 6 (Building 68)": LatLng(26.3098307, 50.1439817),
    "Bus Stop 7 (Building 59)": LatLng(26.3083034, 50.1456665),
    "Bus Stop 8 (Building 76)": LatLng(26.3061739, 50.1477596),
    "Return Stop 2 (Building 59)": LatLng(26.3082931, 50.1458797),
    "Return Stop 3 (Building 68)": LatLng(26.3099747, 50.1442110),
    "Return Stop 4 (Building 63)": LatLng(26.3124151, 50.1423415),
    "Return Stop 5": LatLng(26.3128914, 50.1402363),
    "Return Stop 6 (Omar Mosque)": LatLng(26.3136879, 50.1426664),
    "Return Stop 7 (Building 835)": LatLng(26.3145026, 50.1459618),
  };

  @override
  void initState() {
    super.initState();
    _loadSavedRoute(); // Load saved route when opening screen
  }

  // Save the selected route and return to Home Screen
  Future<void> _saveRouteAndReturn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pickup', pickupLocation ?? "");
    await prefs.setString('destination', destinationLocation ?? "");

    // Return to HomeScreen with new route data
    Navigator.pop(context, {
      'pickup': pickupLocation,
      'destination': destinationLocation,
      'pickupPosition': pickupPosition,
      'destinationPosition': destinationPosition,
    });
  }

  // Load saved route
  Future<void> _loadSavedRoute() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedPickup = prefs.getString('pickup');
    String? savedDestination = prefs.getString('destination');

    if (savedPickup != null &&
        savedDestination != null &&
        locationCoordinates.containsKey(savedPickup) &&
        locationCoordinates.containsKey(savedDestination)) {
      setState(() {
        pickupLocation = savedPickup;
        destinationLocation = savedDestination;
        pickupPosition = locationCoordinates[savedPickup];
        destinationPosition = locationCoordinates[savedDestination];
        showRoute = true;
      });
    }
  }

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
            SizedBox(width: 9),
            Text('BUS SYSTEM',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: pickupPosition ?? LatLng(26.3041, 50.1412),
                initialZoom: 16.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                if (showRoute &&
                    pickupPosition != null &&
                    destinationPosition != null)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [pickupPosition!, destinationPosition!],
                        color: Colors.blue,
                        strokeWidth: 4,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: [
                    if (pickupPosition != null)
                      Marker(
                        point: pickupPosition!,
                        width: 40,
                        height: 40,
                        child: Icon(Icons.location_pin,
                            color: Colors.orange, size: 40),
                      ),
                    if (destinationPosition != null)
                      Marker(
                        point: destinationPosition!,
                        width: 40,
                        height: 40,
                        child: Icon(Icons.location_pin,
                            color: Colors.blue, size: 40),
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
                Text("Route Details",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                _buildDropdown("Pickup", pickupLocation, (value) {
                  setState(() {
                    pickupLocation = value;
                    pickupPosition = locationCoordinates[value];
                  });
                }),
                SizedBox(height: 10),
                _buildDropdown("Destination", destinationLocation, (value) {
                  setState(() {
                    destinationLocation = value;
                    destinationPosition = locationCoordinates[value];
                  });
                }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed:
                      (pickupPosition != null && destinationPosition != null)
                          ? () {
                              setState(() {
                                showRoute = true;
                              });
                              _saveRouteAndReturn(); // Save & return to Home Screen
                            }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Confirm",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
      String label, String? selectedValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: locationCoordinates.keys.map((String location) {
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
