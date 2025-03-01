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

abstract class Station implements _i1.TableRow, _i1.ProtocolSerialization {
  Station._({
    this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Station({
    int? id,
    required String name,
    required double latitude,
    required double longitude,
  }) = _StationImpl;

  factory Station.fromJson(Map<String, dynamic> jsonSerialization) {
    return Station(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
    );
  }

  static final t = StationTable();

  static const db = StationRepository._();

  @override
  int? id;

  String name;

  double latitude;

  double longitude;

  @override
  _i1.Table get table => t;

  Station copyWith({
    int? id,
    String? name,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  static StationInclude include() {
    return StationInclude._();
  }

  static StationIncludeList includeList({
    _i1.WhereExpressionBuilder<StationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StationTable>? orderByList,
    StationInclude? include,
  }) {
    return StationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Station.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Station.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StationImpl extends Station {
  _StationImpl({
    int? id,
    required String name,
    required double latitude,
    required double longitude,
  }) : super._(
          id: id,
          name: name,
          latitude: latitude,
          longitude: longitude,
        );

  @override
  Station copyWith({
    Object? id = _Undefined,
    String? name,
    double? latitude,
    double? longitude,
  }) {
    return Station(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

class StationTable extends _i1.Table {
  StationTable({super.tableRelation}) : super(tableName: 'station') {
    name = _i1.ColumnString(
      'name',
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

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        latitude,
        longitude,
      ];
}

class StationInclude extends _i1.IncludeObject {
  StationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Station.t;
}

class StationIncludeList extends _i1.IncludeList {
  StationIncludeList._({
    _i1.WhereExpressionBuilder<StationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Station.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Station.t;
}

class StationRepository {
  const StationRepository._();

  Future<List<Station>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Station>(
      where: where?.call(Station.t),
      orderBy: orderBy?.call(Station.t),
      orderByList: orderByList?.call(Station.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Station?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StationTable>? where,
    int? offset,
    _i1.OrderByBuilder<StationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Station>(
      where: where?.call(Station.t),
      orderBy: orderBy?.call(Station.t),
      orderByList: orderByList?.call(Station.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Station?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Station>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Station>> insert(
    _i1.Session session,
    List<Station> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Station>(
      rows,
      transaction: transaction,
    );
  }

  Future<Station> insertRow(
    _i1.Session session,
    Station row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Station>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Station>> update(
    _i1.Session session,
    List<Station> rows, {
    _i1.ColumnSelections<StationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Station>(
      rows,
      columns: columns?.call(Station.t),
      transaction: transaction,
    );
  }

  Future<Station> updateRow(
    _i1.Session session,
    Station row, {
    _i1.ColumnSelections<StationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Station>(
      row,
      columns: columns?.call(Station.t),
      transaction: transaction,
    );
  }

  Future<List<Station>> delete(
    _i1.Session session,
    List<Station> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Station>(
      rows,
      transaction: transaction,
    );
  }

  Future<Station> deleteRow(
    _i1.Session session,
    Station row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Station>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Station>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Station>(
      where: where(Station.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Station>(
      where: where?.call(Station.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
