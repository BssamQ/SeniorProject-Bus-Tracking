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

abstract class Stop implements _i1.SerializableModel {
  Stop._({
    this.id,
    required this.stopName,
    required this.latitude,
    required this.longitude,
    required this.stopOrder,
    required this.routeID,
  });

  factory Stop({
    int? id,
    required String stopName,
    required double latitude,
    required double longitude,
    required int stopOrder,
    required int routeID,
  }) = _StopImpl;

  factory Stop.fromJson(Map<String, dynamic> jsonSerialization) {
    return Stop(
      id: jsonSerialization['id'] as int?,
      stopName: jsonSerialization['stopName'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      stopOrder: jsonSerialization['stopOrder'] as int,
      routeID: jsonSerialization['routeID'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String stopName;

  double latitude;

  double longitude;

  int stopOrder;

  int routeID;

  Stop copyWith({
    int? id,
    String? stopName,
    double? latitude,
    double? longitude,
    int? stopOrder,
    int? routeID,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'stopName': stopName,
      'latitude': latitude,
      'longitude': longitude,
      'stopOrder': stopOrder,
      'routeID': routeID,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StopImpl extends Stop {
  _StopImpl({
    int? id,
    required String stopName,
    required double latitude,
    required double longitude,
    required int stopOrder,
    required int routeID,
  }) : super._(
          id: id,
          stopName: stopName,
          latitude: latitude,
          longitude: longitude,
          stopOrder: stopOrder,
          routeID: routeID,
        );

  @override
  Stop copyWith({
    Object? id = _Undefined,
    String? stopName,
    double? latitude,
    double? longitude,
    int? stopOrder,
    int? routeID,
  }) {
    return Stop(
      id: id is int? ? id : this.id,
      stopName: stopName ?? this.stopName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      stopOrder: stopOrder ?? this.stopOrder,
      routeID: routeID ?? this.routeID,
    );
  }
}
