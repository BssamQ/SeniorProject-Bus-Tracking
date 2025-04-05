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

abstract class DriverInfo implements _i1.SerializableModel {
  DriverInfo._({
    this.id,
    required this.userInfoId,
    required this.busId,
  });

  factory DriverInfo({
    int? id,
    required int userInfoId,
    required int busId,
  }) = _DriverInfoImpl;

  factory DriverInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return DriverInfo(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      busId: jsonSerialization['busId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  int busId;

  DriverInfo copyWith({
    int? id,
    int? userInfoId,
    int? busId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'busId': busId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DriverInfoImpl extends DriverInfo {
  _DriverInfoImpl({
    int? id,
    required int userInfoId,
    required int busId,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          busId: busId,
        );

  @override
  DriverInfo copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    int? busId,
  }) {
    return DriverInfo(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      busId: busId ?? this.busId,
    );
  }
}
