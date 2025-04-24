import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import '../main.dart';
import '../Screens/bus_simulator.dart';
import '../Screens/route_loader.dart';

class SelectRouteScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const SelectRouteScreen({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  _SelectRouteScreenState createState() => _SelectRouteScreenState();
}

class _SelectRouteScreenState extends State<SelectRouteScreen> {
  Map<String, LatLng> locationCoordinates = {};
  LatLng? startPoint;
  LatLng? endPoint;
  String? selectedStart;
  String? selectedEnd;
  List<LatLng>? _routePoints;
  final MapController _mapController = MapController();

  late BusSimulator _busSimulator;
  LatLng _busPosition = LatLng(26.3123370, 50.1422222);

  @override
  void initState() {
    super.initState();
    _fetchStations();
    _initBusSimulator();
  }

  Future<void> _fetchStations() async {
    try {
      var stations = await client.station.getAllStations();
      setState(() {
        locationCoordinates = {
          for (var station in stations)
            station.name: LatLng(station.latitude, station.longitude),
        };
      });
    } catch (e) {
      print('Error fetching stations: $e');
    }
  }

  void _initBusSimulator() async {
    final goRoute = await JsonRouteLoader.loadFullGoRoute();
    final returnRoute = await JsonRouteLoader.loadFullReturnRoute();
    final goStations = await JsonRouteLoader.getStationIndices(goRoute);
    final returnStations = await JsonRouteLoader.getStationIndices(returnRoute);

    _busSimulator = BusSimulator(
      goRoute: goRoute,
      returnRoute: returnRoute,
      goStationIndices: goStations,
      returnStationIndices: returnStations,
      onLocationUpdated: (LatLng pos) {
        setState(() {
          _busPosition = pos;
        });
      },
    );

    _busSimulator.start();
  }

  @override
  void dispose() {
    _busSimulator.stop();
    super.dispose();
  }

  void _onMarkerTap(LatLng selectedPoint) {
    if (startPoint == null) {
      setState(() {
        startPoint = selectedPoint;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Start point selected! Tap on destination point.')),
      );
    } else if (endPoint == null) {
      setState(() {
        endPoint = selectedPoint;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('End point selected! Route will be drawn.')),
      );
    } else {
      setState(() {
        startPoint = null;
        endPoint = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Both points reset. Select new points.')),
      );
    }
  }

  Future<void> _drawRoute() async {
    if (startPoint != null && endPoint != null) {
      final OpenRouteService client = OpenRouteService(
        apiKey: '5b3ce3597851110001cf6248518ebe30153142b3b996dfcd4be85b44',
      );

      final List<ORSCoordinate> routeCoordinates =
          await client.directionsRouteCoordsGet(
        startCoordinate: ORSCoordinate(
            latitude: startPoint!.latitude, longitude: startPoint!.longitude),
        endCoordinate: ORSCoordinate(
            latitude: endPoint!.latitude, longitude: endPoint!.longitude),
      );

      final List<LatLng> routePoints = routeCoordinates
          .map(
              (coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
          .toList();

      setState(() {
        _routePoints = routePoints;
      });

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
    bool canDrawRoute = startPoint != null && endPoint != null;

    return Scaffold(
      appBar: AppBar(title: Text('Select Route')),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _busPosition,
                initialZoom: 16.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    ...locationCoordinates.entries.map((entry) {
                      return Marker(
                        point: entry.value,
                        width: 50,
                        height: 50,
                        child: GestureDetector(
                          onTap: () => _onMarkerTap(entry.value),
                          child: Icon(
                            Icons.directions_bus,
                            color: (entry.value == startPoint ||
                                    entry.value == endPoint)
                                ? Colors.green
                                : Colors.blue,
                            size: 40,
                          ),
                        ),
                      );
                    }).toList(),
                    Marker(
                      point: _busPosition,
                      width: 40,
                      height: 40,
                      child: Icon(Icons.directions_bus,
                          color: Colors.green, size: 40),
                    ),
                  ],
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
            child: Text(
              'Draw Route',
              style:
                  TextStyle(color: canDrawRoute ? Colors.white : Colors.grey),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: canDrawRoute ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
