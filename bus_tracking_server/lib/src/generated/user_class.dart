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
import 'notifications_class.dart' as _i2;

abstract class User implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  int? id;

  String name;

  String email;

  String password;

  String role;

  String? location;

  double? latitude;

  double? longitude;

  List<_i2.Notification>? notifications;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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
        'notifications':
            notifications?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static UserInclude include({_i2.NotificationIncludeList? notifications}) {
    return UserInclude._(notifications: notifications);
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
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

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    location = _i1.ColumnString(
      'location',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString email;

  late final _i1.ColumnString password;

  late final _i1.ColumnString role;

  late final _i1.ColumnString location;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  _i2.NotificationTable? ___notifications;

  _i1.ManyRelation<_i2.NotificationTable>? _notifications;

  _i2.NotificationTable get __notifications {
    if (___notifications != null) return ___notifications!;
    ___notifications = _i1.createRelationTable(
      relationFieldName: '__notifications',
      field: User.t.id,
      foreignField: _i2.Notification.t.userID,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.NotificationTable(tableRelation: foreignTableRelation),
    );
    return ___notifications!;
  }

  _i1.ManyRelation<_i2.NotificationTable> get notifications {
    if (_notifications != null) return _notifications!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'notifications',
      field: User.t.id,
      foreignField: _i2.Notification.t.userID,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.NotificationTable(tableRelation: foreignTableRelation),
    );
    _notifications = _i1.ManyRelation<_i2.NotificationTable>(
      tableWithRelations: relationTable,
      table: _i2.NotificationTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _notifications!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        email,
        password,
        role,
        location,
        latitude,
        longitude,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'notifications') {
      return __notifications;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({_i2.NotificationIncludeList? notifications}) {
    _notifications = notifications;
  }

  _i2.NotificationIncludeList? _notifications;

  @override
  Map<String, _i1.Include?> get includes => {'notifications': _notifications};

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  Future<void> notifications(
    _i1.Session session,
    User user,
    List<_i2.Notification> notification, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.any((e) => e.id == null)) {
      throw ArgumentError.notNull('notification.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $notification =
        notification.map((e) => e.copyWith(userID: user.id)).toList();
    await session.db.update<_i2.Notification>(
      $notification,
      columns: [_i2.Notification.t.userID],
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  Future<void> notifications(
    _i1.Session session,
    User user,
    _i2.Notification notification, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $notification = notification.copyWith(userID: user.id);
    await session.db.updateRow<_i2.Notification>(
      $notification,
      columns: [_i2.Notification.t.userID],
      transaction: transaction,
    );
  }
}
