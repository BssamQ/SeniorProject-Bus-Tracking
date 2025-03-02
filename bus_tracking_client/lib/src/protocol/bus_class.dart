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
import 'gps_data_class.dart' as _i2;

abstract class Bus implements _i1.SerializableModel {
  Bus._({
    this.id,
    required this.busNumber,
    required this.routeID,
    required this.driverName,
    required this.latitude,
    required this.longitude,
    required this.status,
    this.gpsData,
  });

  factory Bus({
    int? id,
    required String busNumber,
    required int routeID,
    required String driverName,
    required double latitude,
    required double longitude,
    required String status,
    List<_i2.GPSData>? gpsData,
  }) = _BusImpl;

  factory Bus.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bus(
      id: jsonSerialization['id'] as int?,
      busNumber: jsonSerialization['busNumber'] as String,
      routeID: jsonSerialization['routeID'] as int,
      driverName: jsonSerialization['driverName'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      status: jsonSerialization['status'] as String,
      gpsData: (jsonSerialization['gpsData'] as List?)
          ?.map((e) => _i2.GPSData.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String busNumber;

  int routeID;

  String driverName;

  double latitude;

  double longitude;

  String status;

  List<_i2.GPSData>? gpsData;

  Bus copyWith({
    int? id,
    String? busNumber,
    int? routeID,
    String? driverName,
    double? latitude,
    double? longitude,
    String? status,
    List<_i2.GPSData>? gpsData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'busNumber': busNumber,
      'routeID': routeID,
      'driverName': driverName,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      if (gpsData != null)
        'gpsData': gpsData?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BusImpl extends Bus {
  _BusImpl({
    int? id,
    required String busNumber,
    required int routeID,
    required String driverName,
    required double latitude,
    required double longitude,
    required String status,
    List<_i2.GPSData>? gpsData,
  }) : super._(
          id: id,
          busNumber: busNumber,
          routeID: routeID,
          driverName: driverName,
          latitude: latitude,
          longitude: longitude,
          status: status,
          gpsData: gpsData,
        );

  @override
  Bus copyWith({
    Object? id = _Undefined,
    String? busNumber,
    int? routeID,
    String? driverName,
    double? latitude,
    double? longitude,
    String? status,
    Object? gpsData = _Undefined,
  }) {
    return Bus(
      id: id is int? ? id : this.id,
      busNumber: busNumber ?? this.busNumber,
      routeID: routeID ?? this.routeID,
      driverName: driverName ?? this.driverName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      status: status ?? this.status,
      gpsData: gpsData is List<_i2.GPSData>?
          ? gpsData
          : this.gpsData?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
