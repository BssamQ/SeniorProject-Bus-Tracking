/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'bus_position_class.dart' as _i2;

abstract class SimulationData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SimulationData._({
    required this.routeId,
    required this.positions,
    required this.startTime,
    this.endTime,
    required this.isActive,
  });

  factory SimulationData({
    required String routeId,
    required List<_i2.BusPosition> positions,
    required DateTime startTime,
    DateTime? endTime,
    required bool isActive,
  }) = _SimulationDataImpl;

  factory SimulationData.fromJson(Map<String, dynamic> jsonSerialization) {
    return SimulationData(
      routeId: jsonSerialization['routeId'] as String,
      positions: (jsonSerialization['positions'] as List)
          .map((e) => _i2.BusPosition.fromJson((e as Map<String, dynamic>)))
          .toList(),
      startTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startTime']),
      endTime: jsonSerialization['endTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      isActive: jsonSerialization['isActive'] as bool,
    );
  }

  String routeId;

  List<_i2.BusPosition> positions;

  DateTime startTime;

  DateTime? endTime;

  bool isActive;

  SimulationData copyWith({
    String? routeId,
    List<_i2.BusPosition>? positions,
    DateTime? startTime,
    DateTime? endTime,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'routeId': routeId,
      'positions': positions.toJson(valueToJson: (v) => v.toJson()),
      'startTime': startTime.toJson(),
      if (endTime != null) 'endTime': endTime?.toJson(),
      'isActive': isActive,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'routeId': routeId,
      'positions': positions.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'startTime': startTime.toJson(),
      if (endTime != null) 'endTime': endTime?.toJson(),
      'isActive': isActive,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SimulationDataImpl extends SimulationData {
  _SimulationDataImpl({
    required String routeId,
    required List<_i2.BusPosition> positions,
    required DateTime startTime,
    DateTime? endTime,
    required bool isActive,
  }) : super._(
          routeId: routeId,
          positions: positions,
          startTime: startTime,
          endTime: endTime,
          isActive: isActive,
        );

  @override
  SimulationData copyWith({
    String? routeId,
    List<_i2.BusPosition>? positions,
    DateTime? startTime,
    Object? endTime = _Undefined,
    bool? isActive,
  }) {
    return SimulationData(
      routeId: routeId ?? this.routeId,
      positions:
          positions ?? this.positions.map((e0) => e0.copyWith()).toList(),
      startTime: startTime ?? this.startTime,
      endTime: endTime is DateTime? ? endTime : this.endTime,
      isActive: isActive ?? this.isActive,
    );
  }
}
