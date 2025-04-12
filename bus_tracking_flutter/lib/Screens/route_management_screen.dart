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
  void _showBusDetails(Bus bus) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Bus Details"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bus Number: ${bus.busNumber}"),
            Text("Driver Name: ${bus.driverName}"),
            Text("Age: ${bus.age}"),
            Text("Status: ${bus.status}"),
          ],
        ),
        actions: [
          TextButton(
            child: Text("Close"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }


  void _openEditRouteModal(Routes route) {
    final List<String> availableTimes = [
      '8:00 AM', '9:00 AM', '10:00 AM', '11:00 AM',
      '12:00 PM', '1:00 PM', '2:00 PM', '3:00 PM',
      '4:00 PM', '5:00 PM'
    ];
    String routeName = route.routeName;
    String startTime = route.routeStartTime ?? '8:00 AM';
    String endTime = route.routeEndTime;

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
                  SizedBox(height: 10),
                  if (route.buses == null)
                    Text("No buses assigned to this route.")
                  else if (route.buses!.length <= 2)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Buses:", style: TextStyle(fontWeight: FontWeight.bold)),
                        ...route.buses!.map((bus) => ListTile(
                          title: Text("Bus #${bus.busNumber}"),
                          subtitle: Text("Driver: ${bus.driverName}"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              final updatedBus = bus.copyWith(routeID: null);
                              await client.bus.updateBus(updatedBus);
                              Navigator.pop(context);
                              _fetchStationsAndRoutes();
                            },
                          ),
                          onTap: () => _showBusDetails(bus),
                        )),
                      ],
                    )
                  else
                    ElevatedButton.icon(
                      icon: Icon(Icons.directions_bus),
                      label: Text("View Assigned Buses"),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ListView(
                            padding: EdgeInsets.all(16),
                            children: route.buses!.map((bus) => ListTile(
                              title: Text("Bus #${bus.busNumber}"),
                              subtitle: Text("Driver: ${bus.driverName}"),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () async {
                                  final updatedBus = bus.copyWith(routeID: null);
                                  await client.bus.updateBus(updatedBus);
                                  Navigator.pop(context); // Close bus list
                                  Navigator.pop(context); // Close edit modal
                                  _fetchStationsAndRoutes(); // Refresh
                                },
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                _showBusDetails(bus);
                              },
                            )).toList(),
                          ),
                        );
                      },
                    ),

                  ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Assign Bus to Route"),
                    onPressed: () async {
                      Navigator.pop(context);
                      _openAssignBusesModal(route.id!);
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ElevatedButton(
                        onPressed: () async {
                          // Set routeId to null for all buses assigned to this route
                          if (route.buses != null && route.buses!.isNotEmpty) {
                            for (final bus in route.buses!) {
                              final updatedBus = bus.copyWith(routeID: null);
                              await client.bus.updateBus(updatedBus);
                            }
                          }

                          // Delete the route
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

                      setState(() {
                        newStartStation = null;
                        newEndStation = null;
                        newStartTime = null;
                        newEndTime = null;
                        newRouteName = '';
                      });

                      Routes createdRoute = await client.route.addRoute(newRoute);
                      _fetchStationsAndRoutes();
                      Navigator.pop(context);
                      Future.delayed(Duration(milliseconds: 300), () {
                        //print("Opening assign buses modal for route ID: ${newRoute.id}");
                        _openAssignBusesModal(createdRoute.id!);
                      });
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
  void _openAssignBusesModal(int routeId) async {
    final availableBuses = await client.bus.getUnassignedBuses();

    final selectedBusIds = <int>{};

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Assign Buses", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  if (availableBuses.isEmpty)
                    Column(
                      children: [
                        Text("No available buses to assign.", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Quit"),
                        ),
                      ],
                    )
                  else ...[
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: availableBuses.length,
                        itemBuilder: (context, index) {
                          final bus = availableBuses[index];
                          final isSelected = selectedBusIds.contains(bus.id);

                          return CheckboxListTile(
                            title: Text('Bus #${bus.busNumber} - ${bus.driverName}'),
                            subtitle: Text('Age: ${bus.age}, Status: ${bus.status}'),
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedBusIds.add(bus.id!);
                                } else {
                                  selectedBusIds.remove(bus.id!);
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: availableBuses.isEmpty ? null : () async {
                        if (selectedBusIds.isNotEmpty) {
                          bool allSuccess = true;

                          for (int busId in selectedBusIds) {
                            final bus = availableBuses.firstWhere((b) => b.id == busId);
                            final updatedBus = bus.copyWith(routeID: routeId);
                            final success = await client.bus.updateBus(updatedBus);
                            if (!success) {
                              allSuccess = false;
                            }
                          }

                          if (allSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Buses assigned!")));
                            Navigator.pop(context);
                            _fetchStationsAndRoutes();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some buses failed to update")));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No buses selected")));
                        }
                      },
                      child: Text("Assign Selected Buses"),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
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

  //  Opens a modal bottom sheet with the list of routes.
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