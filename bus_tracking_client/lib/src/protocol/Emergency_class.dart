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

abstract class Emergency implements _i1.SerializableModel {
  Emergency._({
    this.id,
    required this.driverId,
    required this.busId,
    required this.message,
    required this.timestamp,
    required this.isResolved,
  });

  factory Emergency({
    int? id,
    required int driverId,
    required int busId,
    required String message,
    required DateTime timestamp,
    required bool isResolved,
  }) = _EmergencyImpl;

  factory Emergency.fromJson(Map<String, dynamic> jsonSerialization) {
    return Emergency(
      id: jsonSerialization['id'] as int?,
      driverId: jsonSerialization['driverId'] as int,
      busId: jsonSerialization['busId'] as int,
      message: jsonSerialization['message'] as String,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      isResolved: jsonSerialization['isResolved'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int driverId;

  int busId;

  String message;

  DateTime timestamp;

  bool isResolved;

  Emergency copyWith({
    int? id,
    int? driverId,
    int? busId,
    String? message,
    DateTime? timestamp,
    bool? isResolved,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'driverId': driverId,
      'busId': busId,
      'message': message,
      'timestamp': timestamp.toJson(),
      'isResolved': isResolved,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmergencyImpl extends Emergency {
  _EmergencyImpl({
    int? id,
    required int driverId,
    required int busId,
    required String message,
    required DateTime timestamp,
    required bool isResolved,
  }) : super._(
          id: id,
          driverId: driverId,
          busId: busId,
          message: message,
          timestamp: timestamp,
          isResolved: isResolved,
        );

  @override
  Emergency copyWith({
    Object? id = _Undefined,
    int? driverId,
    int? busId,
    String? message,
    DateTime? timestamp,
    bool? isResolved,
  }) {
    return Emergency(
      id: id is int? ? id : this.id,
      driverId: driverId ?? this.driverId,
      busId: busId ?? this.busId,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      isResolved: isResolved ?? this.isResolved,
    );
  }
}
