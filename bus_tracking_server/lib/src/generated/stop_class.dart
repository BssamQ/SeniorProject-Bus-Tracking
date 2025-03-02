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

abstract class Stop implements _i1.TableRow, _i1.ProtocolSerialization {
  Stop._({
    this.id,
    required this.stopName,
    required this.latitude,
    required this.longitude,
    required this.stopOrder,
    this.createdAt,
    required this.routeID,
  });

  factory Stop({
    int? id,
    required String stopName,
    required double latitude,
    required double longitude,
    required int stopOrder,
    DateTime? createdAt,
    required int routeID,
  }) = _StopImpl;

  factory Stop.fromJson(Map<String, dynamic> jsonSerialization) {
    return Stop(
      id: jsonSerialization['id'] as int?,
      stopName: jsonSerialization['stopName'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      stopOrder: jsonSerialization['stopOrder'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      routeID: jsonSerialization['routeID'] as int,
    );
  }

  static final t = StopTable();

  static const db = StopRepository._();

  @override
  int? id;

  String stopName;

  double latitude;

  double longitude;

  int stopOrder;

  DateTime? createdAt;

  int routeID;

  @override
  _i1.Table get table => t;

  Stop copyWith({
    int? id,
    String? stopName,
    double? latitude,
    double? longitude,
    int? stopOrder,
    DateTime? createdAt,
    int? routeID,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'stopName': stopName,
      'latitude': latitude,
      'longitude': longitude,
      'stopOrder': stopOrder,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      'routeID': routeID,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'stopName': stopName,
      'latitude': latitude,
      'longitude': longitude,
      'stopOrder': stopOrder,
      'routeID': routeID,
    };
  }

  static StopInclude include() {
    return StopInclude._();
  }

  static StopIncludeList includeList({
    _i1.WhereExpressionBuilder<StopTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StopTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StopTable>? orderByList,
    StopInclude? include,
  }) {
    return StopIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Stop.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Stop.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StopImpl extends Stop {
  _StopImpl({
    int? id,
    required String stopName,
    required double latitude,
    required double longitude,
    required int stopOrder,
    DateTime? createdAt,
    required int routeID,
  }) : super._(
          id: id,
          stopName: stopName,
          latitude: latitude,
          longitude: longitude,
          stopOrder: stopOrder,
          createdAt: createdAt,
          routeID: routeID,
        );

  @override
  Stop copyWith({
    Object? id = _Undefined,
    String? stopName,
    double? latitude,
    double? longitude,
    int? stopOrder,
    Object? createdAt = _Undefined,
    int? routeID,
  }) {
    return Stop(
      id: id is int? ? id : this.id,
      stopName: stopName ?? this.stopName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      stopOrder: stopOrder ?? this.stopOrder,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      routeID: routeID ?? this.routeID,
    );
  }
}

class StopTable extends _i1.Table {
  StopTable({super.tableRelation}) : super(tableName: 'stop') {
    stopName = _i1.ColumnString(
      'stopName',
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
    stopOrder = _i1.ColumnInt(
      'stopOrder',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    routeID = _i1.ColumnInt(
      'routeID',
      this,
    );
  }

  late final _i1.ColumnString stopName;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnInt stopOrder;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt routeID;

  @override
  List<_i1.Column> get columns => [
        id,
        stopName,
        latitude,
        longitude,
        stopOrder,
        createdAt,
        routeID,
      ];
}

class StopInclude extends _i1.IncludeObject {
  StopInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Stop.t;
}

class StopIncludeList extends _i1.IncludeList {
  StopIncludeList._({
    _i1.WhereExpressionBuilder<StopTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Stop.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Stop.t;
}

class StopRepository {
  const StopRepository._();

  Future<List<Stop>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StopTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StopTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StopTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Stop>(
      where: where?.call(Stop.t),
      orderBy: orderBy?.call(Stop.t),
      orderByList: orderByList?.call(Stop.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Stop?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StopTable>? where,
    int? offset,
    _i1.OrderByBuilder<StopTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StopTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Stop>(
      where: where?.call(Stop.t),
      orderBy: orderBy?.call(Stop.t),
      orderByList: orderByList?.call(Stop.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Stop?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Stop>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Stop>> insert(
    _i1.Session session,
    List<Stop> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Stop>(
      rows,
      transaction: transaction,
    );
  }

  Future<Stop> insertRow(
    _i1.Session session,
    Stop row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Stop>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Stop>> update(
    _i1.Session session,
    List<Stop> rows, {
    _i1.ColumnSelections<StopTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Stop>(
      rows,
      columns: columns?.call(Stop.t),
      transaction: transaction,
    );
  }

  Future<Stop> updateRow(
    _i1.Session session,
    Stop row, {
    _i1.ColumnSelections<StopTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Stop>(
      row,
      columns: columns?.call(Stop.t),
      transaction: transaction,
    );
  }

  Future<List<Stop>> delete(
    _i1.Session session,
    List<Stop> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Stop>(
      rows,
      transaction: transaction,
    );
  }

  Future<Stop> deleteRow(
    _i1.Session session,
    Stop row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Stop>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Stop>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StopTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Stop>(
      where: where(Stop.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StopTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Stop>(
      where: where?.call(Stop.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
