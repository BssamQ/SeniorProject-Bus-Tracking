import 'dart:async';
import 'package:latlong2/latlong.dart';

class BusSimulator {
  final List<LatLng> goRoute;
  final List<LatLng> returnRoute;
  final List<int> goStationIndices;
  final List<int> returnStationIndices;
  final Function(LatLng) onLocationUpdated;

  late Timer _timer;
  int _currentIndex = 0;
  bool _goingForward = true;

  BusSimulator({
    required this.goRoute,
    required this.returnRoute,
    required this.goStationIndices,
    required this.returnStationIndices,
    required this.onLocationUpdated,
  });

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final route = _goingForward ? goRoute : returnRoute;

      if (_currentIndex < route.length) {
        onLocationUpdated(route[_currentIndex]);
        _currentIndex++;
      } else {
        _currentIndex = 0;
        _goingForward = !_goingForward;
      }
    });
  }

  void stop() {
    _timer.cancel();
  }
}
