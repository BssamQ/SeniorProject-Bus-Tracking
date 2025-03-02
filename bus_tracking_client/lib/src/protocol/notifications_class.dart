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

abstract class Notification implements _i1.SerializableModel {
  Notification._({
    this.id,
    required this.userID,
    required this.message,
    required this.type,
    required this.timestamp,
    required this.readStatus,
  });

  factory Notification({
    int? id,
    required int userID,
    required String message,
    required String type,
    required DateTime timestamp,
    required String readStatus,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] as int?,
      userID: jsonSerialization['userID'] as int,
      message: jsonSerialization['message'] as String,
      type: jsonSerialization['type'] as String,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      readStatus: jsonSerialization['readStatus'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userID;

  String message;

  String type;

  DateTime timestamp;

  String readStatus;

  Notification copyWith({
    int? id,
    int? userID,
    String? message,
    String? type,
    DateTime? timestamp,
    String? readStatus,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userID': userID,
      'message': message,
      'type': type,
      'timestamp': timestamp.toJson(),
      'readStatus': readStatus,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    int? id,
    required int userID,
    required String message,
    required String type,
    required DateTime timestamp,
    required String readStatus,
  }) : super._(
          id: id,
          userID: userID,
          message: message,
          type: type,
          timestamp: timestamp,
          readStatus: readStatus,
        );

  @override
  Notification copyWith({
    Object? id = _Undefined,
    int? userID,
    String? message,
    String? type,
    DateTime? timestamp,
    String? readStatus,
  }) {
    return Notification(
      id: id is int? ? id : this.id,
      userID: userID ?? this.userID,
      message: message ?? this.message,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      readStatus: readStatus ?? this.readStatus,
    );
  }
}
