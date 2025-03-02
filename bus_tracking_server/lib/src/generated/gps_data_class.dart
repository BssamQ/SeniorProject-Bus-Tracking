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

abstract class GPSData implements _i1.TableRow, _i1.ProtocolSerialization {
  GPSData._({
    this.id,
    required this.busID,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
  });

  factory GPSData({
    int? id,
    required int busID,
    required DateTime timestamp,
    required double latitude,
    required double longitude,
  }) = _GPSDataImpl;

  factory GPSData.fromJson(Map<String, dynamic> jsonSerialization) {
    return GPSData(
      id: jsonSerialization['id'] as int?,
      busID: jsonSerialization['busID'] as int,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
    );
  }

  static final t = GPSDataTable();

  static const db = GPSDataRepository._();

  @override
  int? id;

  int busID;

  DateTime timestamp;

  double latitude;

  double longitude;

  @override
  _i1.Table get table => t;

  GPSData copyWith({
    int? id,
    int? busID,
    DateTime? timestamp,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'busID': busID,
      'timestamp': timestamp.toJson(),
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'busID': busID,
      'timestamp': timestamp.toJson(),
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  static GPSDataInclude include() {
    return GPSDataInclude._();
  }

  static GPSDataIncludeList includeList({
    _i1.WhereExpressionBuilder<GPSDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GPSDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GPSDataTable>? orderByList,
    GPSDataInclude? include,
  }) {
    return GPSDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GPSData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GPSData.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GPSDataImpl extends GPSData {
  _GPSDataImpl({
    int? id,
    required int busID,
    required DateTime timestamp,
    required double latitude,
    required double longitude,
  }) : super._(
          id: id,
          busID: busID,
          timestamp: timestamp,
          latitude: latitude,
          longitude: longitude,
        );

  @override
  GPSData copyWith({
    Object? id = _Undefined,
    int? busID,
    DateTime? timestamp,
    double? latitude,
    double? longitude,
  }) {
    return GPSData(
      id: id is int? ? id : this.id,
      busID: busID ?? this.busID,
      timestamp: timestamp ?? this.timestamp,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

class GPSDataTable extends _i1.Table {
  GPSDataTable({super.tableRelation}) : super(tableName: 'gps_data') {
    busID = _i1.ColumnInt(
      'busID',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
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

  late final _i1.ColumnInt busID;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  @override
  List<_i1.Column> get columns => [
        id,
        busID,
        timestamp,
        latitude,
        longitude,
      ];
}

class GPSDataInclude extends _i1.IncludeObject {
  GPSDataInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => GPSData.t;
}

class GPSDataIncludeList extends _i1.IncludeList {
  GPSDataIncludeList._({
    _i1.WhereExpressionBuilder<GPSDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GPSData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => GPSData.t;
}

class GPSDataRepository {
  const GPSDataRepository._();

  Future<List<GPSData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GPSDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GPSDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GPSDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<GPSData>(
      where: where?.call(GPSData.t),
      orderBy: orderBy?.call(GPSData.t),
      orderByList: orderByList?.call(GPSData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<GPSData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GPSDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<GPSDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GPSDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<GPSData>(
      where: where?.call(GPSData.t),
      orderBy: orderBy?.call(GPSData.t),
      orderByList: orderByList?.call(GPSData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<GPSData?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<GPSData>(
      id,
      transaction: transaction,
    );
  }

  Future<List<GPSData>> insert(
    _i1.Session session,
    List<GPSData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GPSData>(
      rows,
      transaction: transaction,
    );
  }

  Future<GPSData> insertRow(
    _i1.Session session,
    GPSData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GPSData>(
      row,
      transaction: transaction,
    );
  }

  Future<List<GPSData>> update(
    _i1.Session session,
    List<GPSData> rows, {
    _i1.ColumnSelections<GPSDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GPSData>(
      rows,
      columns: columns?.call(GPSData.t),
      transaction: transaction,
    );
  }

  Future<GPSData> updateRow(
    _i1.Session session,
    GPSData row, {
    _i1.ColumnSelections<GPSDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GPSData>(
      row,
      columns: columns?.call(GPSData.t),
      transaction: transaction,
    );
  }

  Future<List<GPSData>> delete(
    _i1.Session session,
    List<GPSData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GPSData>(
      rows,
      transaction: transaction,
    );
  }

  Future<GPSData> deleteRow(
    _i1.Session session,
    GPSData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GPSData>(
      row,
      transaction: transaction,
    );
  }

  Future<List<GPSData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GPSDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GPSData>(
      where: where(GPSData.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GPSDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GPSData>(
      where: where?.call(GPSData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
