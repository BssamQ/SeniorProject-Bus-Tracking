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

abstract class Emergency implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = EmergencyTable();

  static const db = EmergencyRepository._();

  @override
  int? id;

  int driverId;

  int busId;

  String message;

  DateTime timestamp;

  bool isResolved;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'driverId': driverId,
      'busId': busId,
      'message': message,
      'timestamp': timestamp.toJson(),
      'isResolved': isResolved,
    };
  }

  static EmergencyInclude include() {
    return EmergencyInclude._();
  }

  static EmergencyIncludeList includeList({
    _i1.WhereExpressionBuilder<EmergencyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmergencyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmergencyTable>? orderByList,
    EmergencyInclude? include,
  }) {
    return EmergencyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Emergency.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Emergency.t),
      include: include,
    );
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

class EmergencyTable extends _i1.Table {
  EmergencyTable({super.tableRelation}) : super(tableName: 'emergency') {
    driverId = _i1.ColumnInt(
      'driverId',
      this,
    );
    busId = _i1.ColumnInt(
      'busId',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    isResolved = _i1.ColumnBool(
      'isResolved',
      this,
    );
  }

  late final _i1.ColumnInt driverId;

  late final _i1.ColumnInt busId;

  late final _i1.ColumnString message;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnBool isResolved;

  @override
  List<_i1.Column> get columns => [
        id,
        driverId,
        busId,
        message,
        timestamp,
        isResolved,
      ];
}

class EmergencyInclude extends _i1.IncludeObject {
  EmergencyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Emergency.t;
}

class EmergencyIncludeList extends _i1.IncludeList {
  EmergencyIncludeList._({
    _i1.WhereExpressionBuilder<EmergencyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Emergency.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Emergency.t;
}

class EmergencyRepository {
  const EmergencyRepository._();

  Future<List<Emergency>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmergencyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmergencyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmergencyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Emergency>(
      where: where?.call(Emergency.t),
      orderBy: orderBy?.call(Emergency.t),
      orderByList: orderByList?.call(Emergency.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Emergency?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmergencyTable>? where,
    int? offset,
    _i1.OrderByBuilder<EmergencyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmergencyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Emergency>(
      where: where?.call(Emergency.t),
      orderBy: orderBy?.call(Emergency.t),
      orderByList: orderByList?.call(Emergency.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Emergency?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Emergency>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Emergency>> insert(
    _i1.Session session,
    List<Emergency> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Emergency>(
      rows,
      transaction: transaction,
    );
  }

  Future<Emergency> insertRow(
    _i1.Session session,
    Emergency row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Emergency>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Emergency>> update(
    _i1.Session session,
    List<Emergency> rows, {
    _i1.ColumnSelections<EmergencyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Emergency>(
      rows,
      columns: columns?.call(Emergency.t),
      transaction: transaction,
    );
  }

  Future<Emergency> updateRow(
    _i1.Session session,
    Emergency row, {
    _i1.ColumnSelections<EmergencyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Emergency>(
      row,
      columns: columns?.call(Emergency.t),
      transaction: transaction,
    );
  }

  Future<List<Emergency>> delete(
    _i1.Session session,
    List<Emergency> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Emergency>(
      rows,
      transaction: transaction,
    );
  }

  Future<Emergency> deleteRow(
    _i1.Session session,
    Emergency row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Emergency>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Emergency>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EmergencyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Emergency>(
      where: where(Emergency.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmergencyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Emergency>(
      where: where?.call(Emergency.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
