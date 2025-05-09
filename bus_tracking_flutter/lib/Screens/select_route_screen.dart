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

  String? estimatedTimeToStart;
  String? estimatedTimeToDestination;
  String busNumber = 'BUS-204';
  String driverName = 'Mohammed Ahmed';
  bool busHasArrived = false;
  bool tripCompleted = false;

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

        if (estimatedTimeToStart != null && !busHasArrived) {
          _calculateTimeToStart();
          _checkIfBusArrived();
        }

        if (_routePoints != null && !tripCompleted) {
          _calculateTimeToDestination();
        }
      },
    );

    _busSimulator.start();
  }

  void _checkIfBusArrived() {
    if (startPoint != null) {
      final Distance distance = Distance();
      final meters = distance(_busPosition, startPoint!);
      if (meters < 50 && !busHasArrived) {
        setState(() {
          busHasArrived = true;
          estimatedTimeToStart = 'Arrived';
        });

        // After 1 second, switch to showing destination time only
        Future.delayed(Duration(seconds: 1), () {
          if (context.mounted) {
            setState(() {
              estimatedTimeToStart = null;

              // Force destination time to show now that pickup is hidden
              if (endPoint != null && !tripCompleted) {
                _calculateTimeToDestination(); // ensures destination time is ready
              }
            });
          }
        });

      }
    }
  }


  Future<void> _calculateTimeToStart() async {
    if (startPoint == null || busHasArrived) return;

    try {
      final Distance distance = Distance();
      final double meters = distance(_busPosition, startPoint!);

      final estimatedSeconds = meters / 3.0;
      final minutes = (estimatedSeconds / 60).clamp(1, 20).round();

      setState(() {
        estimatedTimeToStart = '$minutes min';
      });
    } catch (e) {
      print('Failed to estimate time: $e');
    }
  }

  Future<void> _calculateTimeToDestination() async {
    if (endPoint == null || tripCompleted) return;

    try {
      final Distance distance = Distance();
      final double meters = distance(_busPosition, endPoint!);

      final estimatedSeconds = meters / 3.0;
      final minutes = (estimatedSeconds / 60).clamp(1, 20).round();

      setState(() {
        estimatedTimeToDestination = '$minutes min';
      });

      if (meters < 50) {
        tripCompleted = true;

        await Future.delayed(Duration(seconds: 2));

        setState(() {
          _routePoints = null;
          estimatedTimeToStart = null;
          estimatedTimeToDestination = null;
        });

        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Trip Complete'),
              content: Text('The bus has arrived at your destination.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                )
              ],
            ),
          );
        }
      }
    } catch (e) {
      print('Failed to estimate time to destination: $e');
    }
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
        busHasArrived = false;
      });
    } else if (endPoint == null) {
      setState(() {
        endPoint = selectedPoint;
      });
    } else {
      setState(() {
        startPoint = null;
        endPoint = null;
        busHasArrived = false;
        estimatedTimeToStart = null;
        estimatedTimeToDestination = null;
        _routePoints = null;
        tripCompleted = false;
      });
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
          .map((coordinate) =>
          LatLng(coordinate.latitude, coordinate.longitude))
          .toList();

      setState(() {
        _routePoints = routePoints;
        estimatedTimeToStart = null;
        estimatedTimeToDestination = null;
        tripCompleted = false;
      });

      final midLat = (startPoint!.latitude + endPoint!.latitude) / 2;
      final midLng = (startPoint!.longitude + endPoint!.longitude) / 2;
      _mapController.move(LatLng(midLat, midLng), 16.0);

      await _calculateTimeToStart();
      await _calculateTimeToDestination();
    }
  }

  void _selectStart(String stop) {
    setState(() {
      selectedStart = stop;
      startPoint = locationCoordinates[stop];
      busHasArrived = false;
      estimatedTimeToStart = null;
      estimatedTimeToDestination = null;
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
          if (estimatedTimeToStart != null || estimatedTimeToDestination != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0.0, 0.5),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                    child: estimatedTimeToStart != null
                        ? Column(
                      key: ValueKey('pickup'),
                      children: [
                        Text(
                          'Estimated time to pickup: $estimatedTimeToStart',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text('Bus Number: $busNumber'),
                        Text('Driver Name: $driverName'),
                      ],
                    )
                        : estimatedTimeToDestination != null
                        ? Column(
                      key: ValueKey('destination'),
                      children: [
                        Text(
                          'Estimated time to destination: $estimatedTimeToDestination',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text('Bus Number: $busNumber'),
                        Text('Driver Name: $driverName'),
                      ],
                    )
                        : SizedBox.shrink(),
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
            style: ElevatedButton.styleFrom(
              backgroundColor: canDrawRoute ? Colors.green : Colors.grey,
            ),
            child: Text(
              'Draw Route',
              style:
              TextStyle(color: canDrawRoute ? Colors.white : Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
