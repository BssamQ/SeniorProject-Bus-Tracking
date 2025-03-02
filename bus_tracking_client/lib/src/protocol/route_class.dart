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

abstract class Route implements _i1.SerializableModel {
  Route._({
    this.id,
    required this.routeName,
    this.stops,
    required this.routeStartTime,
    required this.startPoint,
    required this.routeEndTime,
    required this.endPoint,
    this.buses,
  });

  factory Route({
    int? id,
    required String routeName,
    List<_i2.Stop>? stops,
    required String routeStartTime,
    required String startPoint,
    required String routeEndTime,
    required String endPoint,
    List<_i3.Bus>? buses,
  }) = _RouteImpl;

  factory Route.fromJson(Map<String, dynamic> jsonSerialization) {
    return Route(
      id: jsonSerialization['id'] as int?,
      routeName: jsonSerialization['routeName'] as String,
      stops: (jsonSerialization['stops'] as List?)
          ?.map((e) => _i2.Stop.fromJson((e as Map<String, dynamic>)))
          .toList(),
      routeStartTime: jsonSerialization['routeStartTime'] as String,
      startPoint: jsonSerialization['startPoint'] as String,
      routeEndTime: jsonSerialization['routeEndTime'] as String,
      endPoint: jsonSerialization['endPoint'] as String,
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

  String routeStartTime;

  String startPoint;

  String routeEndTime;

  String endPoint;

  List<_i3.Bus>? buses;

  Route copyWith({
    int? id,
    String? routeName,
    List<_i2.Stop>? stops,
    String? routeStartTime,
    String? startPoint,
    String? routeEndTime,
    String? endPoint,
    List<_i3.Bus>? buses,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'routeName': routeName,
      if (stops != null) 'stops': stops?.toJson(valueToJson: (v) => v.toJson()),
      'routeStartTime': routeStartTime,
      'startPoint': startPoint,
      'routeEndTime': routeEndTime,
      'endPoint': endPoint,
      if (buses != null) 'buses': buses?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteImpl extends Route {
  _RouteImpl({
    int? id,
    required String routeName,
    List<_i2.Stop>? stops,
    required String routeStartTime,
    required String startPoint,
    required String routeEndTime,
    required String endPoint,
    List<_i3.Bus>? buses,
  }) : super._(
          id: id,
          routeName: routeName,
          stops: stops,
          routeStartTime: routeStartTime,
          startPoint: startPoint,
          routeEndTime: routeEndTime,
          endPoint: endPoint,
          buses: buses,
        );

  @override
  Route copyWith({
    Object? id = _Undefined,
    String? routeName,
    Object? stops = _Undefined,
    String? routeStartTime,
    String? startPoint,
    String? routeEndTime,
    String? endPoint,
    Object? buses = _Undefined,
  }) {
    return Route(
      id: id is int? ? id : this.id,
      routeName: routeName ?? this.routeName,
      stops: stops is List<_i2.Stop>?
          ? stops
          : this.stops?.map((e0) => e0.copyWith()).toList(),
      routeStartTime: routeStartTime ?? this.routeStartTime,
      startPoint: startPoint ?? this.startPoint,
      routeEndTime: routeEndTime ?? this.routeEndTime,
      endPoint: endPoint ?? this.endPoint,
      buses: buses is List<_i3.Bus>?
          ? buses
          : this.buses?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
