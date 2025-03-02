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
import 'notifications_class.dart' as _i2;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.location,
    this.latitude,
    this.longitude,
    this.notifications,
  });

  factory User({
    int? id,
    required String name,
    required String email,
    required String password,
    required String role,
    String? location,
    double? latitude,
    double? longitude,
    List<_i2.Notification>? notifications,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      role: jsonSerialization['role'] as String,
      location: jsonSerialization['location'] as String?,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      notifications: (jsonSerialization['notifications'] as List?)
          ?.map((e) => _i2.Notification.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String email;

  String password;

  String role;

  String? location;

  double? latitude;

  double? longitude;

  List<_i2.Notification>? notifications;

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? role,
    String? location,
    double? latitude,
    double? longitude,
    List<_i2.Notification>? notifications,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      if (location != null) 'location': location,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (notifications != null)
        'notifications': notifications?.toJson(valueToJson: (v) => v.toJson()),
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
    required String name,
    required String email,
    required String password,
    required String role,
    String? location,
    double? latitude,
    double? longitude,
    List<_i2.Notification>? notifications,
  }) : super._(
          id: id,
          name: name,
          email: email,
          password: password,
          role: role,
          location: location,
          latitude: latitude,
          longitude: longitude,
          notifications: notifications,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
    String? password,
    String? role,
    Object? location = _Undefined,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    Object? notifications = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      location: location is String? ? location : this.location,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      notifications: notifications is List<_i2.Notification>?
          ? notifications
          : this.notifications?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
