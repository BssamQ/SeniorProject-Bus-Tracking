/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'stop_class.dart' as _i2;
import 'bus_class.dart' as _i3;

abstract class Routes implements _i1.SerializableModel {
  Routes._({
    this.id,
    required this.routeName,
    this.stops,
    this.routeStartTime,
    required this.startlatitude,
    required this.startlongitude,
    required this.routeEndTime,
    required this.endlatitude,
    required this.endlongitude,
    this.buses,
  });

  factory Routes({
    int? id,
    required String routeName,
    List<_i2.Stop>? stops,
    String? routeStartTime,
    required double startlatitude,
    required double startlongitude,
    required String routeEndTime,
    required double endlatitude,
    required double endlongitude,
    List<_i3.Bus>? buses,
  }) = _RoutesImpl;

  factory Routes.fromJson(Map<String, dynamic> jsonSerialization) {
    return Routes(
      id: jsonSerialization['id'] as int?,
      routeName: jsonSerialization['routeName'] as String,
      stops: (jsonSerialization['stops'] as List?)
          ?.map((e) => _i2.Stop.fromJson((e as Map<String, dynamic>)))
          .toList(),
      routeStartTime: jsonSerialization['routeStartTime'] as String?,
      startlatitude: (jsonSerialization['startlatitude'] as num).toDouble(),
      startlongitude: (jsonSerialization['startlongitude'] as num).toDouble(),
      routeEndTime: jsonSerialization['routeEndTime'] as String,
      endlatitude: (jsonSerialization['endlatitude'] as num).toDouble(),
      endlongitude: (jsonSerialization['endlongitude'] as num).toDouble(),
      buses: (jsonSerialization['buses'] as List?)
          ?.map((e) => _i3.Bus.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String routeName;

  List<_i2.Stop>? stops;

  String? routeStartTime;

  double startlatitude;

  double startlongitude;

  String routeEndTime;

  double endlatitude;

  double endlongitude;

  List<_i3.Bus>? buses;

  Routes copyWith({
    int? id,
    String? routeName,
    List<_i2.Stop>? stops,
    String? routeStartTime,
    double? startlatitude,
    double? startlongitude,
    String? routeEndTime,
    double? endlatitude,
    double? endlongitude,
    List<_i3.Bus>? buses,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'routeName': routeName,
      if (stops != null) 'stops': stops?.toJson(valueToJson: (v) => v.toJson()),
      if (routeStartTime != null) 'routeStartTime': routeStartTime,
      'startlatitude': startlatitude,
      'startlongitude': startlongitude,
      'routeEndTime': routeEndTime,
      'endlatitude': endlatitude,
      'endlongitude': endlongitude,
      if (buses != null) 'buses': buses?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoutesImpl extends Routes {
  _RoutesImpl({
    int? id,
    required String routeName,
    List<_i2.Stop>? stops,
    String? routeStartTime,
    required double startlatitude,
    required double startlongitude,
    required String routeEndTime,
    required double endlatitude,
    required double endlongitude,
    List<_i3.Bus>? buses,
  }) : super._(
          id: id,
          routeName: routeName,
          stops: stops,
          routeStartTime: routeStartTime,
          startlatitude: startlatitude,
          startlongitude: startlongitude,
          routeEndTime: routeEndTime,
          endlatitude: endlatitude,
          endlongitude: endlongitude,
          buses: buses,
        );

  @override
  Routes copyWith({
    Object? id = _Undefined,
    String? routeName,
    Object? stops = _Undefined,
    Object? routeStartTime = _Undefined,
    double? startlatitude,
    double? startlongitude,
    String? routeEndTime,
    double? endlatitude,
    double? endlongitude,
    Object? buses = _Undefined,
  }) {
    return Routes(
      id: id is int? ? id : this.id,
      routeName: routeName ?? this.routeName,
      stops: stops is List<_i2.Stop>?
          ? stops
          : this.stops?.map((e0) => e0.copyWith()).toList(),
      routeStartTime:
          routeStartTime is String? ? routeStartTime : this.routeStartTime,
      startlatitude: startlatitude ?? this.startlatitude,
      startlongitude: startlongitude ?? this.startlongitude,
      routeEndTime: routeEndTime ?? this.routeEndTime,
      endlatitude: endlatitude ?? this.endlatitude,
      endlongitude: endlongitude ?? this.endlongitude,
      buses: buses is List<_i3.Bus>?
          ? buses
          : this.buses?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
