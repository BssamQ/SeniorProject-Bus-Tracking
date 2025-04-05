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

abstract class BusPosition implements _i1.SerializableModel {
  BusPosition._({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  factory BusPosition({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  }) = _BusPositionImpl;

  factory BusPosition.fromJson(Map<String, dynamic> jsonSerialization) {
    return BusPosition(
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
    );
  }

  double latitude;

  double longitude;

  DateTime timestamp;

  BusPosition copyWith({
    double? latitude,
    double? longitude,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _BusPositionImpl extends BusPosition {
  _BusPositionImpl({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
  }) : super._(
          latitude: latitude,
          longitude: longitude,
          timestamp: timestamp,
        );

  @override
  BusPosition copyWith({
    double? latitude,
    double? longitude,
    DateTime? timestamp,
  }) {
    return BusPosition(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
