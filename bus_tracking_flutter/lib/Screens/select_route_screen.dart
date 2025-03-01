import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import '../main.dart';

class SelectRouteScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const SelectRouteScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  _SelectRouteScreenState createState() => _SelectRouteScreenState();
}

class _SelectRouteScreenState extends State<SelectRouteScreen> {

  Future<void> _fetchStations() async {
    try {
      var stations = await client.station.getAllStations();
      setState(() {
        // Map stations to a Map<String, LatLng>
        locationCoordinates = {
          for (var station in stations)
            station.name: LatLng( station.latitude, station.longitude
            ),
        };
      });
    } catch (e) {
      // Handle error (e.g., show a snackbar)
      print('Error fetching stations: $e');
    }
  }

  Map<String, LatLng> locationCoordinates = {};


  LatLng? startPoint;
  LatLng? endPoint;

  String? selectedStart;
  String? selectedEnd;

  // We'll store the route points here.
  List<LatLng>? _routePoints;

  // Use the MapController from flutter_map.
  final MapController _mapController = MapController();

  void _onMarkerTap(LatLng selectedPoint) async {
    if (startPoint == null) {
      setState(() {
        startPoint = selectedPoint;
        // Optionally, if using separate state, set startMarkerColor = Colors.green;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Start point selected! Tap on destination point.')),
      );
    } else if (endPoint == null) {
      setState(() {
        endPoint = selectedPoint;
        // Optionally, set endMarkerColor = Colors.green;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('End point selected! Route will be drawn.')),
      );
    } else {
      setState(() {
        startPoint = null;
        endPoint = null;
        // Optionally, reset marker colors here.
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Both points reset. Select new points.')),
      );
    }
  }


  // Old straight-line polyline function is replaced by _drawRoute which queries OpenRouteService.
  Future<void> _drawRoute() async {
    if (startPoint != null && endPoint != null) {
      // Initialize OpenRouteService client with your API key.
      final OpenRouteService client = OpenRouteService(apiKey: '5b3ce3597851110001cf6248518ebe30153142b3b996dfcd4be85b44');

      // Use the client's built-in function if available.
      // Note: Depending on the version of open_route_service package,
      // the API might differ. Here, we use a generic approach:
      final List<ORSCoordinate> routeCoordinates = await client.directionsRouteCoordsGet(
        startCoordinate: ORSCoordinate(latitude: startPoint!.latitude, longitude: startPoint!.longitude),
        endCoordinate: ORSCoordinate(latitude: endPoint!.latitude, longitude: endPoint!.longitude),
      );

      final List<LatLng> routePoints = routeCoordinates
          .map((coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
          .toList();

      setState(() {
        _routePoints = routePoints;
      });

      // Optionally, adjust map view to center on the route:
      final midLat = (startPoint!.latitude + endPoint!.latitude) / 2;
      final midLng = (startPoint!.longitude + endPoint!.longitude) / 2;
      _mapController.move(LatLng(midLat, midLng), 16.0);
    }
  }

  void _selectStart(String stop) {
    setState(() {
      selectedStart = stop;
      startPoint = locationCoordinates[stop];
    });
  }

  void _selectEnd(String stop) {
    setState(() {
      selectedEnd = stop;
      endPoint = locationCoordinates[stop];
    });
  }

  @override
  Widget build(BuildContext context) {
    _fetchStations();
    bool canDrawRoute = startPoint != null && endPoint != null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Route'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: LatLng(26.3123370, 50.1422222),
                initialZoom: 16.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: locationCoordinates.entries.map((entry) {
                    return Marker(
                      point: entry.value,
                      width: 50,
                      height: 50,
                      child: GestureDetector(
                        onTap: () => _onMarkerTap(entry.value),
                        child: Icon(
                          Icons.directions_bus,
                          color: (entry.value == startPoint || entry.value == endPoint)
                              ? Colors.green
                              : Colors.blue,
                          size: 40,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                if (_routePoints != null)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _routePoints!,
                        strokeWidth: 4,
                        color: Colors.red,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Start button
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ListView(
                        children: locationCoordinates.keys.map((station) {
                          return ListTile(
                            title: Text(station),
                            enabled: selectedEnd != station,
                            onTap: selectedEnd != station
                                ? () {
                              _selectStart(station);
                              Navigator.pop(context);
                            }
                                : null,
                          );
                        }).toList(),
                      );
                    },
                  );
                },
                child: Text(selectedStart ?? 'Select Start'),
              ),
              // End button
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ListView(
                        children: locationCoordinates.keys.map((station) {
                          return ListTile(
                            title: Text(station),
                            enabled: selectedStart != station,
                            onTap: selectedStart != station
                                ? () {
                              _selectEnd(station);
                              Navigator.pop(context);
                            }
                                : null,
                          );
                        }).toList(),
                      );
                    },
                  );
                },
                child: Text(selectedEnd ?? 'Select End'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: canDrawRoute ? _drawRoute : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canDrawRoute ? Colors.green : Colors.grey,
            ),
            child: Text(
              'Draw Route',
              style: TextStyle(
                color: canDrawRoute ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
