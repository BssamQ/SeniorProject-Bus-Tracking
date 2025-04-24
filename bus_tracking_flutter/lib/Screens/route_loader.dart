import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';

class JsonRouteLoader {
  static Future<List<LatLng>> _loadSingleRoute(String path) async {
    final jsonStr = await rootBundle.loadString(path);
    final Map<String, dynamic> data = json.decode(jsonStr);
    final List coords = data['geometry']['coordinates'];
    return coords.map<LatLng>((coord) => LatLng(coord[1], coord[0])).toList();
  }

  static Future<List<LatLng>> loadFullGoRoute() async {
    final List<String> files = [
      'assets/routes/route.json',
      'assets/routes/route1.json',
      'assets/routes/route2.json',
      'assets/routes/route3.json',
      'assets/routes/route4.json',
      'assets/routes/route5.json',
      'assets/routes/route6.json',
    ];
    List<LatLng> fullRoute = [];
    for (final path in files) {
      fullRoute.addAll(await _loadSingleRoute(path));
    }
    return fullRoute;
  }

  static Future<List<LatLng>> loadFullReturnRoute() async {
    final List<String> files = [
      'assets/routes/return.json',
      'assets/routes/return1.json',
      'assets/routes/return2.json',
      'assets/routes/return3.json',
      'assets/routes/return4.json',
      'assets/routes/return5.json',
      'assets/routes/return6.json',
    ];
    List<LatLng> fullRoute = [];
    for (final path in files) {
      fullRoute.addAll(await _loadSingleRoute(path));
    }
    return fullRoute;
  }

  static Future<List<int>> getStationIndices(List<LatLng> route) async {
    return List.generate(route.length ~/ 10, (i) => i * 10);
  }
}
