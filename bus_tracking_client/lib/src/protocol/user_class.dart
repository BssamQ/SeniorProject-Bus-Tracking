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
    required this.name,
    required this.email,
    required this.role,
    required this.passwordHash,
    required this.lastLogin,
  });

  factory User({
    int? id,
    required String name,
    required String email,
    required String role,
    required String passwordHash,
    required DateTime lastLogin,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
      passwordHash: jsonSerialization['passwordHash'] as String,
      lastLogin:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastLogin']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String email;

  String role;

  String passwordHash;

  DateTime lastLogin;

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? role,
    String? passwordHash,
    DateTime? lastLogin,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'role': role,
      'passwordHash': passwordHash,
      'lastLogin': lastLogin.toJson(),
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
    required String role,
    required String passwordHash,
    required DateTime lastLogin,
  }) : super._(
          id: id,
          name: name,
          email: email,
          role: role,
          passwordHash: passwordHash,
          lastLogin: lastLogin,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
    String? role,
    String? passwordHash,
    DateTime? lastLogin,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      passwordHash: passwordHash ?? this.passwordHash,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }
}
