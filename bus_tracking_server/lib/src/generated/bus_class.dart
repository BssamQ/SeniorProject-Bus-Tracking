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
import 'gps_data_class.dart' as _i2;

abstract class Bus implements _i1.TableRow, _i1.ProtocolSerialization {
  Bus._({
    this.id,
    required this.busNumber,
    this.routeID,
    required this.driverName,
    this.latitude,
    this.longitude,
    required this.status,
    this.gpsData,
    required this.age,
    required this.breakdownCounter,
  });

  factory Bus({
    int? id,
    required String busNumber,
    int? routeID,
    required String driverName,
    double? latitude,
    double? longitude,
    required String status,
    List<_i2.GPSData>? gpsData,
    required int age,
    required int breakdownCounter,
  }) = _BusImpl;

  factory Bus.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bus(
      id: jsonSerialization['id'] as int?,
      busNumber: jsonSerialization['busNumber'] as String,
      routeID: jsonSerialization['routeID'] as int?,
      driverName: jsonSerialization['driverName'] as String,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      status: jsonSerialization['status'] as String,
      gpsData: (jsonSerialization['gpsData'] as List?)
          ?.map((e) => _i2.GPSData.fromJson((e as Map<String, dynamic>)))
          .toList(),
      age: jsonSerialization['age'] as int,
      breakdownCounter: jsonSerialization['breakdownCounter'] as int,
    );
  }

  static final t = BusTable();

  static const db = BusRepository._();

  @override
  int? id;

  String busNumber;

  int? routeID;

  String driverName;

  double? latitude;

  double? longitude;

  String status;

  List<_i2.GPSData>? gpsData;

  int age;

  int breakdownCounter;

  @override
  _i1.Table get table => t;

  Bus copyWith({
    int? id,
    String? busNumber,
    int? routeID,
    String? driverName,
    double? latitude,
    double? longitude,
    String? status,
    List<_i2.GPSData>? gpsData,
    int? age,
    int? breakdownCounter,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'busNumber': busNumber,
      if (routeID != null) 'routeID': routeID,
      'driverName': driverName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'status': status,
      if (gpsData != null)
        'gpsData': gpsData?.toJson(valueToJson: (v) => v.toJson()),
      'age': age,
      'breakdownCounter': breakdownCounter,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'busNumber': busNumber,
      if (routeID != null) 'routeID': routeID,
      'driverName': driverName,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'status': status,
      if (gpsData != null)
        'gpsData': gpsData?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'age': age,
      'breakdownCounter': breakdownCounter,
    };
  }

  static BusInclude include({_i2.GPSDataIncludeList? gpsData}) {
    return BusInclude._(gpsData: gpsData);
  }

  static BusIncludeList includeList({
    _i1.WhereExpressionBuilder<BusTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusTable>? orderByList,
    BusInclude? include,
  }) {
    return BusIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bus.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Bus.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BusImpl extends Bus {
  _BusImpl({
    int? id,
    required String busNumber,
    int? routeID,
    required String driverName,
    double? latitude,
    double? longitude,
    required String status,
    List<_i2.GPSData>? gpsData,
    required int age,
    required int breakdownCounter,
  }) : super._(
          id: id,
          busNumber: busNumber,
          routeID: routeID,
          driverName: driverName,
          latitude: latitude,
          longitude: longitude,
          status: status,
          gpsData: gpsData,
          age: age,
          breakdownCounter: breakdownCounter,
        );

  @override
  Bus copyWith({
    Object? id = _Undefined,
    String? busNumber,
    Object? routeID = _Undefined,
    String? driverName,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    String? status,
    Object? gpsData = _Undefined,
    int? age,
    int? breakdownCounter,
  }) {
    return Bus(
      id: id is int? ? id : this.id,
      busNumber: busNumber ?? this.busNumber,
      routeID: routeID is int? ? routeID : this.routeID,
      driverName: driverName ?? this.driverName,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      status: status ?? this.status,
      gpsData: gpsData is List<_i2.GPSData>?
          ? gpsData
          : this.gpsData?.map((e0) => e0.copyWith()).toList(),
      age: age ?? this.age,
      breakdownCounter: breakdownCounter ?? this.breakdownCounter,
    );
  }
}

class BusTable extends _i1.Table {
  BusTable({super.tableRelation}) : super(tableName: 'bus') {
    busNumber = _i1.ColumnString(
      'busNumber',
      this,
    );
    routeID = _i1.ColumnInt(
      'routeID',
      this,
    );
    driverName = _i1.ColumnString(
      'driverName',
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
    status = _i1.ColumnString(
      'status',
      this,
    );
    age = _i1.ColumnInt(
      'age',
      this,
    );
    breakdownCounter = _i1.ColumnInt(
      'breakdownCounter',
      this,
    );
  }

  late final _i1.ColumnString busNumber;

  late final _i1.ColumnInt routeID;

  late final _i1.ColumnString driverName;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnString status;

  _i2.GPSDataTable? ___gpsData;

  _i1.ManyRelation<_i2.GPSDataTable>? _gpsData;

  late final _i1.ColumnInt age;

  late final _i1.ColumnInt breakdownCounter;

  _i2.GPSDataTable get __gpsData {
    if (___gpsData != null) return ___gpsData!;
    ___gpsData = _i1.createRelationTable(
      relationFieldName: '__gpsData',
      field: Bus.t.id,
      foreignField: _i2.GPSData.t.busID,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GPSDataTable(tableRelation: foreignTableRelation),
    );
    return ___gpsData!;
  }

  _i1.ManyRelation<_i2.GPSDataTable> get gpsData {
    if (_gpsData != null) return _gpsData!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'gpsData',
      field: Bus.t.id,
      foreignField: _i2.GPSData.t.busID,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GPSDataTable(tableRelation: foreignTableRelation),
    );
    _gpsData = _i1.ManyRelation<_i2.GPSDataTable>(
      tableWithRelations: relationTable,
      table: _i2.GPSDataTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _gpsData!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        busNumber,
        routeID,
        driverName,
        latitude,
        longitude,
        status,
        age,
        breakdownCounter,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gpsData') {
      return __gpsData;
    }
    return null;
  }
}

class BusInclude extends _i1.IncludeObject {
  BusInclude._({_i2.GPSDataIncludeList? gpsData}) {
    _gpsData = gpsData;
  }

  _i2.GPSDataIncludeList? _gpsData;

  @override
  Map<String, _i1.Include?> get includes => {'gpsData': _gpsData};

  @override
  _i1.Table get table => Bus.t;
}

class BusIncludeList extends _i1.IncludeList {
  BusIncludeList._({
    _i1.WhereExpressionBuilder<BusTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Bus.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Bus.t;
}

class BusRepository {
  const BusRepository._();

  final attach = const BusAttachRepository._();

  final attachRow = const BusAttachRowRepository._();

  Future<List<Bus>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BusTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusTable>? orderByList,
    _i1.Transaction? transaction,
    BusInclude? include,
  }) async {
    return session.db.find<Bus>(
      where: where?.call(Bus.t),
      orderBy: orderBy?.call(Bus.t),
      orderByList: orderByList?.call(Bus.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Bus?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusTable>? where,
    int? offset,
    _i1.OrderByBuilder<BusTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BusTable>? orderByList,
    _i1.Transaction? transaction,
    BusInclude? include,
  }) async {
    return session.db.findFirstRow<Bus>(
      where: where?.call(Bus.t),
      orderBy: orderBy?.call(Bus.t),
      orderByList: orderByList?.call(Bus.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Bus?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    BusInclude? include,
  }) async {
    return session.db.findById<Bus>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Bus>> insert(
    _i1.Session session,
    List<Bus> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Bus>(
      rows,
      transaction: transaction,
    );
  }

  Future<Bus> insertRow(
    _i1.Session session,
    Bus row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Bus>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Bus>> update(
    _i1.Session session,
    List<Bus> rows, {
    _i1.ColumnSelections<BusTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Bus>(
      rows,
      columns: columns?.call(Bus.t),
      transaction: transaction,
    );
  }

  Future<Bus> updateRow(
    _i1.Session session,
    Bus row, {
    _i1.ColumnSelections<BusTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Bus>(
      row,
      columns: columns?.call(Bus.t),
      transaction: transaction,
    );
  }

  Future<List<Bus>> delete(
    _i1.Session session,
    List<Bus> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Bus>(
      rows,
      transaction: transaction,
    );
  }

  Future<Bus> deleteRow(
    _i1.Session session,
    Bus row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Bus>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Bus>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BusTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Bus>(
      where: where(Bus.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BusTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Bus>(
      where: where?.call(Bus.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BusAttachRepository {
  const BusAttachRepository._();

  Future<void> gpsData(
    _i1.Session session,
    Bus bus,
    List<_i2.GPSData> gPSData, {
    _i1.Transaction? transaction,
  }) async {
    if (gPSData.any((e) => e.id == null)) {
      throw ArgumentError.notNull('gPSData.id');
    }
    if (bus.id == null) {
      throw ArgumentError.notNull('bus.id');
    }

    var $gPSData = gPSData.map((e) => e.copyWith(busID: bus.id)).toList();
    await session.db.update<_i2.GPSData>(
      $gPSData,
      columns: [_i2.GPSData.t.busID],
      transaction: transaction,
    );
  }
}

class BusAttachRowRepository {
  const BusAttachRowRepository._();

  Future<void> gpsData(
    _i1.Session session,
    Bus bus,
    _i2.GPSData gPSData, {
    _i1.Transaction? transaction,
  }) async {
    if (gPSData.id == null) {
      throw ArgumentError.notNull('gPSData.id');
    }
    if (bus.id == null) {
      throw ArgumentError.notNull('bus.id');
    }

    var $gPSData = gPSData.copyWith(busID: bus.id);
    await session.db.updateRow<_i2.GPSData>(
      $gPSData,
      columns: [_i2.GPSData.t.busID],
      transaction: transaction,
    );
  }
}
