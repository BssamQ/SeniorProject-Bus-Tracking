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

abstract class GPSData implements _i1.SerializableModel {
  GPSData._({
    this.id,
    required this.busID,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
  });

  factory GPSData({
    int? id,
    required int busID,
    required DateTime timestamp,
    required double latitude,
    required double longitude,
  }) = _GPSDataImpl;

  factory GPSData.fromJson(Map<String, dynamic> jsonSerialization) {
    return GPSData(
      id: jsonSerialization['id'] as int?,
      busID: jsonSerialization['busID'] as int,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int busID;

  DateTime timestamp;

  double latitude;

  double longitude;

  GPSData copyWith({
    int? id,
    int? busID,
    DateTime? timestamp,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'busID': busID,
      'timestamp': timestamp.toJson(),
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GPSDataImpl extends GPSData {
  _GPSDataImpl({
    int? id,
    required int busID,
    required DateTime timestamp,
    required double latitude,
    required double longitude,
  }) : super._(
          id: id,
          busID: busID,
          timestamp: timestamp,
          latitude: latitude,
          longitude: longitude,
        );

  @override
  GPSData copyWith({
    Object? id = _Undefined,
    int? busID,
    DateTime? timestamp,
    double? latitude,
    double? longitude,
  }) {
    return GPSData(
      id: id is int? ? id : this.id,
      busID: busID ?? this.busID,
      timestamp: timestamp ?? this.timestamp,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
