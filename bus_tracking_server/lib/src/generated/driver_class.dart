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

abstract class DriverInfo implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = DriverInfoTable();

  static const db = DriverInfoRepository._();

  @override
  int? id;

  int userInfoId;

  int busId;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'busId': busId,
    };
  }

  static DriverInfoInclude include() {
    return DriverInfoInclude._();
  }

  static DriverInfoIncludeList includeList({
    _i1.WhereExpressionBuilder<DriverInfoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DriverInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverInfoTable>? orderByList,
    DriverInfoInclude? include,
  }) {
    return DriverInfoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DriverInfo.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DriverInfo.t),
      include: include,
    );
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

class DriverInfoTable extends _i1.Table {
  DriverInfoTable({super.tableRelation}) : super(tableName: 'driver_info') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    busId = _i1.ColumnInt(
      'busId',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  late final _i1.ColumnInt busId;

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        busId,
      ];
}

class DriverInfoInclude extends _i1.IncludeObject {
  DriverInfoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => DriverInfo.t;
}

class DriverInfoIncludeList extends _i1.IncludeList {
  DriverInfoIncludeList._({
    _i1.WhereExpressionBuilder<DriverInfoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DriverInfo.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DriverInfo.t;
}

class DriverInfoRepository {
  const DriverInfoRepository._();

  Future<List<DriverInfo>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DriverInfoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DriverInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverInfoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DriverInfo>(
      where: where?.call(DriverInfo.t),
      orderBy: orderBy?.call(DriverInfo.t),
      orderByList: orderByList?.call(DriverInfo.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DriverInfo?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DriverInfoTable>? where,
    int? offset,
    _i1.OrderByBuilder<DriverInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DriverInfoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DriverInfo>(
      where: where?.call(DriverInfo.t),
      orderBy: orderBy?.call(DriverInfo.t),
      orderByList: orderByList?.call(DriverInfo.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<DriverInfo?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DriverInfo>(
      id,
      transaction: transaction,
    );
  }

  Future<List<DriverInfo>> insert(
    _i1.Session session,
    List<DriverInfo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DriverInfo>(
      rows,
      transaction: transaction,
    );
  }

  Future<DriverInfo> insertRow(
    _i1.Session session,
    DriverInfo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DriverInfo>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DriverInfo>> update(
    _i1.Session session,
    List<DriverInfo> rows, {
    _i1.ColumnSelections<DriverInfoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DriverInfo>(
      rows,
      columns: columns?.call(DriverInfo.t),
      transaction: transaction,
    );
  }

  Future<DriverInfo> updateRow(
    _i1.Session session,
    DriverInfo row, {
    _i1.ColumnSelections<DriverInfoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DriverInfo>(
      row,
      columns: columns?.call(DriverInfo.t),
      transaction: transaction,
    );
  }

  Future<List<DriverInfo>> delete(
    _i1.Session session,
    List<DriverInfo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DriverInfo>(
      rows,
      transaction: transaction,
    );
  }

  Future<DriverInfo> deleteRow(
    _i1.Session session,
    DriverInfo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DriverInfo>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DriverInfo>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DriverInfoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DriverInfo>(
      where: where(DriverInfo.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DriverInfoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DriverInfo>(
      where: where?.call(DriverInfo.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
