import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import '../main.dart';

class RouteManagementScreen extends StatefulWidget {
  @override
  _RouteManagementScreenState createState() => _RouteManagementScreenState();
}

class _RouteManagementScreenState extends State<RouteManagementScreen> {
  final MapController _mapController = MapController();
  Map<String, LatLng> stationsCoordinates = {}; // station name -> latlng
  List<Routes> allRoutes = []; // Routes from DB
  List<Station> allStations = []; // Stations from DB
  Routes? selectedRoute;
  Station? newStartStation;
  Station? newEndStation;
  String? newStartTime;
  String? newEndTime;
  String newRouteName = '';
  List<LatLng> newRoutePoints = [];
  bool isLoading = true; // Track loading state

  // New state for highlighting route selected from the list.
  int? _highlightedRouteIndex;

  @override
  void initState() {
    super.initState();
    _fetchStationsAndRoutes();
  }

  Future<void> _fetchStationsAndRoutes() async {
    try {
      final stations = await client.station.getAllStations();
      final routes = await client.route.getAllRoutes();

      // Fetch route points for all routes
      final routePointsList = await Future.wait(
        routes.map((route) => _getRoutePoints(route)),
      );

      setState(() {
        stationsCoordinates = {
          for (var station in stations)
            station.name: LatLng(station.latitude, station.longitude),
        };
        allStations = stations;
        allRoutes = routes;
        _interactivePolylines = _buildInteractivePolylines(routes, routePointsList);
        isLoading = false; // Mark loading as complete
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch data: $e")),
      );
    }
  }

  /// Helper method to fetch route points using OpenRouteService
  Future<List<LatLng>> _getRoutePoints(Routes route) async {
    try {
      final OpenRouteService clientRoute = OpenRouteService(
          apiKey: '5b3ce3597851110001cf6248518ebe30153142b3b996dfcd4be85b44');
      final List<ORSCoordinate> routeCoordinates = await clientRoute.directionsRouteCoordsGet(
        startCoordinate: ORSCoordinate(latitude: route.startlatitude, longitude: route.startlongitude),
        endCoordinate: ORSCoordinate(latitude: route.endlatitude, longitude: route.endlongitude),
      );
      return routeCoordinates.map((coord) => LatLng(coord.latitude, coord.longitude)).toList();
    } catch (e) {
      // If OpenRouteService fails, fall back to a straight line between start and end points
      return [
        LatLng(route.startlatitude, route.startlongitude),
        LatLng(route.endlatitude, route.endlongitude),
      ];
    }
  }

  /// Build interactive polylines with unique colors
  List<TaggedPolyline> _buildInteractivePolylines(List<Routes> routes, List<List<LatLng>> routePointsList) {
    List<TaggedPolyline> polylines = [];
    Map<TaggedPolyline, int> polylineIndexMap = {};

    for (int i = 0; i < routes.length; i++) {
      final polyline = TaggedPolyline(
        points: routePointsList[i],
        color: _getRouteColor(i),
        strokeWidth: 4,
        borderColor: Colors.white,
        borderStrokeWidth: 0,
        isDotted: false,
      );
      polylines.add(polyline);
      polylineIndexMap[polyline] = i; // Map the polyline to its index
    }

    if (newRoutePoints.isNotEmpty) {
      final polyline = TaggedPolyline(
        points: newRoutePoints,
        color: Colors.orange,
        strokeWidth: 4,
      );
      polylines.add(polyline);
      polylineIndexMap[polyline] = -1; // Use -1 for the new route
    }

    return polylines;
  }

  /// Helper method to assign unique colors to routes
  Color _getRouteColor(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.teal,
      Colors.cyan,
      Colors.indigo,
    ];
    return colors[index % colors.length];
  }

  void _openEditRouteModal(Routes route) {
    // Define the available times.
    final List<String> availableTimes = [
      '8:00 AM', '9:00 AM', '10:00 AM', '11:00 AM',
      '12:00 PM', '1:00 PM', '2:00 PM', '3:00 PM',
      '4:00 PM', '5:00 PM'
    ];
    String routeName = route.routeName;
    String startTime = route.routeStartTime ?? '8:00 AM';
    String endTime = route.routeEndTime;

    // Ensure the times are one of the available items.
    if (!availableTimes.contains(startTime)) {
      startTime = availableTimes[0];
    }
    if (!availableTimes.contains(endTime)) {
      endTime = availableTimes[0];
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        String editedStartTime = startTime;
        String editedEndTime = endTime;
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Edit Route", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(labelText: 'Route Name'),
                    controller: TextEditingController(text: routeName),
                    onChanged: (val) => routeName = val,
                  ),
                  DropdownButton<String>(
                    value: editedStartTime,
                    items: _generateTimeDropdownItems(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => editedStartTime = val);
                      }
                    },
                  ),
                  DropdownButton<String>(
                    value: editedEndTime,
                    items: _generateTimeDropdownItems(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => editedEndTime = val);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await client.route.deleteRoute(route.id!);
                          _fetchStationsAndRoutes();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Text("Delete"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final updatedRoute = route.copyWith(
                            routeName: routeName,
                            routeStartTime: editedStartTime,
                            routeEndTime: editedEndTime,
                          );
                          await client.route.updateRoute(updatedRoute);
                          _fetchStationsAndRoutes();
                          Navigator.pop(context);
                        },
                        child: Text("Save"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      // Clear the highlighted route when done editing.
      setState(() {
        _highlightedRouteIndex = null;
      });
    });
  }

  void _openNewRouteModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("New Route", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextField(
                  decoration: InputDecoration(labelText: 'Route Name'),
                  onChanged: (val) => newRouteName = val,
                ),
                DropdownButton<Station>(
                  hint: Text("Select Start Station"),
                  value: newStartStation,
                  items: allStations.map((station) => DropdownMenuItem(
                    value: station,
                    child: Text(station.name),
                  )).toList(),
                  onChanged: (val) {
                    setState(() => newStartStation = val);
                  },
                ),
                DropdownButton<Station>(
                  hint: Text("Select End Station"),
                  value: newEndStation,
                  items: allStations.map((station) => DropdownMenuItem(
                    value: station,
                    child: Text(station.name),
                  )).toList(),
                  onChanged: (val) {
                    setState(() => newEndStation = val);
                  },
                ),
                DropdownButton<String>(
                  hint: Text("Select Start Time"),
                  value: newStartTime,
                  items: _generateTimeDropdownItems(),
                  onChanged: (val) {
                    setState(() => newStartTime = val);
                  },
                ),
                DropdownButton<String>(
                  hint: Text("Select End Time"),
                  value: newEndTime,
                  items: _generateTimeDropdownItems(),
                  onChanged: (val) {
                    setState(() => newEndTime = val);
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (newStartStation == null || newEndStation == null || newStartTime == null || newEndTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all fields")),
                      );
                      return;
                    }
                    try {
                      final newRoute = Routes(
                        routeName: newRouteName,
                        routeStartTime: newStartTime!,
                        routeEndTime: newEndTime!,
                        startlatitude: newStartStation!.latitude,
                        startlongitude: newStartStation!.longitude,
                        endlatitude: newEndStation!.latitude,
                        endlongitude: newEndStation!.longitude,
                        stops: [],
                        buses: [],
                      );
                      await client.route.addRoute(newRoute);
                      setState(() {
                        newStartStation = null;
                        newEndStation = null;
                        newStartTime = null;
                        newEndTime = null;
                        newRouteName = '';
                      });
                      _fetchStationsAndRoutes();
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to add route: $e")),
                      );
                    }
                  },
                  child: Text("Save Route"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _generateTimeDropdownItems() {
    final List<String> times = [
      '8:00 AM', '9:00 AM', '10:00 AM', '11:00 AM',
      '12:00 PM', '1:00 PM', '2:00 PM', '3:00 PM',
      '4:00 PM', '5:00 PM'
    ];
    return times.map((time) => DropdownMenuItem(value: time, child: Text(time))).toList();
  }

  late List<TaggedPolyline> _interactivePolylines;

  // New method: Opens a modal bottom sheet with the list of routes.
  void _openRoutesListModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView.builder(
        itemCount: allRoutes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(allRoutes[index].routeName),
            onTap: () {
              // Highlight the selected route
              setState(() {
                _highlightedRouteIndex = index;
              });
              // Optionally move the map to center on the route's start point.
              _mapController.move(
                LatLng(allRoutes[index].startlatitude, allRoutes[index].startlongitude),
                16.0,
              );
              Navigator.pop(context);
              // Open the edit modal for the selected route.
              _openEditRouteModal(allRoutes[index]);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Route Management"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: LatLng(26.3123370, 50.1422222),
                initialZoom: 16.0,
                onTap: (tapPosition, latLng) {},
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: stationsCoordinates.entries.map((entry) => Marker(
                    point: entry.value,
                    child: Icon(Icons.location_on, color: Colors.red),
                  )).toList(),
                ),
                TappablePolylineLayer(
                  polylineCulling: false,
                  pointerDistanceTolerance: 20, // adjust sensitivity for tapping
                  polylines: _interactivePolylines,
                  onTap: (polyline, tapPosition) {
                    // Ensure the polyline is treated as a TaggedPolyline
                    if (polyline is TaggedPolyline) {
                      int index = _interactivePolylines.indexOf(polyline as TaggedPolyline);
                      if (index != -1 && index < allRoutes.length) {
                        _openEditRouteModal(allRoutes[index]);
                      }
                    }
                  },
                ),
                //if a route is highlighted, draw a thicker polyline on top.
                if (_highlightedRouteIndex != null && _highlightedRouteIndex! < allRoutes.length)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _interactivePolylines[_highlightedRouteIndex!].points,
                        strokeWidth: 8,
                        color: Colors.yellow,
                      )
                    ],
                  ),
              ],
            ),
          ),
          // button for adding new route
          ElevatedButton(
            onPressed: _openNewRouteModal,
            child: Text("Add New Route"),
          ),
          //button for showing routes list
          ElevatedButton(
            onPressed: _openRoutesListModal,
            child: Text("Routes List"),
          ),
        ],
      ),
    );
  }
}
