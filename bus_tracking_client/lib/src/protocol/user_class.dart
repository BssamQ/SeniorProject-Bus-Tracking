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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    this.userId,
    required this.role,
    this.location,
    this.latitude,
    this.longitude,
  });

  factory User({
    int? id,
    int? userId,
    required String role,
    String? location,
    double? latitude,
    double? longitude,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      role: jsonSerialization['role'] as String,
      location: jsonSerialization['location'] as String?,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? userId;

  String role;

  String? location;

  double? latitude;

  double? longitude;

  User copyWith({
    int? id,
    int? userId,
    String? role,
    String? location,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'role': role,
      if (location != null) 'location': location,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    int? userId,
    required String role,
    String? location,
    double? latitude,
    double? longitude,
  }) : super._(
          id: id,
          userId: userId,
          role: role,
          location: location,
          latitude: latitude,
          longitude: longitude,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    String? role,
    Object? location = _Undefined,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      role: role ?? this.role,
      location: location is String? ? location : this.location,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
    );
  }
}
