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
import 'stop_class.dart' as _i2;
import 'bus_class.dart' as _i3;

abstract class Routes implements _i1.TableRow, _i1.ProtocolSerialization {
  Routes._({
    this.id,
    required this.routeName,
    this.stops,
    this.routeStartTime,
    required this.startlatitude,
    required this.startlongitude,
    required this.routeEndTime,
    required this.endlatitude,
    required this.endlongitude,
    this.createdAt,
    this.buses,
  });

  factory Routes({
    int? id,
    required String routeName,
    List<_i2.Stop>? stops,
    String? routeStartTime,
    required double startlatitude,
    required double startlongitude,
    required String routeEndTime,
    required double endlatitude,
    required double endlongitude,
    DateTime? createdAt,
    List<_i3.Bus>? buses,
  }) = _RoutesImpl;

  factory Routes.fromJson(Map<String, dynamic> jsonSerialization) {
    return Routes(
      id: jsonSerialization['id'] as int?,
      routeName: jsonSerialization['routeName'] as String,
      stops: (jsonSerialization['stops'] as List?)
          ?.map((e) => _i2.Stop.fromJson((e as Map<String, dynamic>)))
          .toList(),
      routeStartTime: jsonSerialization['routeStartTime'] as String?,
      startlatitude: (jsonSerialization['startlatitude'] as num).toDouble(),
      startlongitude: (jsonSerialization['startlongitude'] as num).toDouble(),
      routeEndTime: jsonSerialization['routeEndTime'] as String,
      endlatitude: (jsonSerialization['endlatitude'] as num).toDouble(),
      endlongitude: (jsonSerialization['endlongitude'] as num).toDouble(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      buses: (jsonSerialization['buses'] as List?)
          ?.map((e) => _i3.Bus.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = RoutesTable();

  static const db = RoutesRepository._();

  @override
  int? id;

  String routeName;

  List<_i2.Stop>? stops;

  String? routeStartTime;

  double startlatitude;

  double startlongitude;

  String routeEndTime;

  double endlatitude;

  double endlongitude;

  DateTime? createdAt;

  List<_i3.Bus>? buses;

  @override
  _i1.Table get table => t;

  Routes copyWith({
    int? id,
    String? routeName,
    List<_i2.Stop>? stops,
    String? routeStartTime,
    double? startlatitude,
    double? startlongitude,
    String? routeEndTime,
    double? endlatitude,
    double? endlongitude,
    DateTime? createdAt,
    List<_i3.Bus>? buses,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'routeName': routeName,
      if (stops != null) 'stops': stops?.toJson(valueToJson: (v) => v.toJson()),
      if (routeStartTime != null) 'routeStartTime': routeStartTime,
      'startlatitude': startlatitude,
      'startlongitude': startlongitude,
      'routeEndTime': routeEndTime,
      'endlatitude': endlatitude,
      'endlongitude': endlongitude,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (buses != null) 'buses': buses?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'routeName': routeName,
      if (stops != null)
        'stops': stops?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (routeStartTime != null) 'routeStartTime': routeStartTime,
      'startlatitude': startlatitude,
      'startlongitude': startlongitude,
      'routeEndTime': routeEndTime,
      'endlatitude': endlatitude,
      'endlongitude': endlongitude,
      if (buses != null)
        'buses': buses?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static RoutesInclude include({
    _i2.StopIncludeList? stops,
    _i3.BusIncludeList? buses,
  }) {
    return RoutesInclude._(
      stops: stops,
      buses: buses,
    );
  }

  static RoutesIncludeList includeList({
    _i1.WhereExpressionBuilder<RoutesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoutesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoutesTable>? orderByList,
    RoutesInclude? include,
  }) {
    return RoutesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Routes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Routes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoutesImpl extends Routes {
  _RoutesImpl({
    int? id,
    required String routeName,
    List<_i2.Stop>? stops,
    String? routeStartTime,
    required double startlatitude,
    required double startlongitude,
    required String routeEndTime,
    required double endlatitude,
    required double endlongitude,
    DateTime? createdAt,
    List<_i3.Bus>? buses,
  }) : super._(
          id: id,
          routeName: routeName,
          stops: stops,
          routeStartTime: routeStartTime,
          startlatitude: startlatitude,
          startlongitude: startlongitude,
          routeEndTime: routeEndTime,
          endlatitude: endlatitude,
          endlongitude: endlongitude,
          createdAt: createdAt,
          buses: buses,
        );

  @override
  Routes copyWith({
    Object? id = _Undefined,
    String? routeName,
    Object? stops = _Undefined,
    Object? routeStartTime = _Undefined,
    double? startlatitude,
    double? startlongitude,
    String? routeEndTime,
    double? endlatitude,
    double? endlongitude,
    Object? createdAt = _Undefined,
    Object? buses = _Undefined,
  }) {
    return Routes(
      id: id is int? ? id : this.id,
      routeName: routeName ?? this.routeName,
      stops: stops is List<_i2.Stop>?
          ? stops
          : this.stops?.map((e0) => e0.copyWith()).toList(),
      routeStartTime:
          routeStartTime is String? ? routeStartTime : this.routeStartTime,
      startlatitude: startlatitude ?? this.startlatitude,
      startlongitude: startlongitude ?? this.startlongitude,
      routeEndTime: routeEndTime ?? this.routeEndTime,
      endlatitude: endlatitude ?? this.endlatitude,
      endlongitude: endlongitude ?? this.endlongitude,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      buses: buses is List<_i3.Bus>?
          ? buses
          : this.buses?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class RoutesTable extends _i1.Table {
  RoutesTable({super.tableRelation}) : super(tableName: 'routes') {
    routeName = _i1.ColumnString(
      'routeName',
      this,
    );
    routeStartTime = _i1.ColumnString(
      'routeStartTime',
      this,
    );
    startlatitude = _i1.ColumnDouble(
      'startlatitude',
      this,
    );
    startlongitude = _i1.ColumnDouble(
      'startlongitude',
      this,
    );
    routeEndTime = _i1.ColumnString(
      'routeEndTime',
      this,
    );
    endlatitude = _i1.ColumnDouble(
      'endlatitude',
      this,
    );
    endlongitude = _i1.ColumnDouble(
      'endlongitude',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString routeName;

  _i2.StopTable? ___stops;

  _i1.ManyRelation<_i2.StopTable>? _stops;

  late final _i1.ColumnString routeStartTime;

  late final _i1.ColumnDouble startlatitude;

  late final _i1.ColumnDouble startlongitude;

  late final _i1.ColumnString routeEndTime;

  late final _i1.ColumnDouble endlatitude;

  late final _i1.ColumnDouble endlongitude;

  late final _i1.ColumnDateTime createdAt;

  _i3.BusTable? ___buses;

  _i1.ManyRelation<_i3.BusTable>? _buses;

  _i2.StopTable get __stops {
    if (___stops != null) return ___stops!;
    ___stops = _i1.createRelationTable(
      relationFieldName: '__stops',
      field: Routes.t.id,
      foreignField: _i2.Stop.t.routeID,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.StopTable(tableRelation: foreignTableRelation),
    );
    return ___stops!;
  }

  _i3.BusTable get __buses {
    if (___buses != null) return ___buses!;
    ___buses = _i1.createRelationTable(
      relationFieldName: '__buses',
      field: Routes.t.id,
      foreignField: _i3.Bus.t.routeID,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.BusTable(tableRelation: foreignTableRelation),
    );
    return ___buses!;
  }

  _i1.ManyRelation<_i2.StopTable> get stops {
    if (_stops != null) return _stops!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'stops',
      field: Routes.t.id,
      foreignField: _i2.Stop.t.routeID,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.StopTable(tableRelation: foreignTableRelation),
    );
    _stops = _i1.ManyRelation<_i2.StopTable>(
      tableWithRelations: relationTable,
      table: _i2.StopTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _stops!;
  }

  _i1.ManyRelation<_i3.BusTable> get buses {
    if (_buses != null) return _buses!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'buses',
      field: Routes.t.id,
      foreignField: _i3.Bus.t.routeID,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.BusTable(tableRelation: foreignTableRelation),
    );
    _buses = _i1.ManyRelation<_i3.BusTable>(
      tableWithRelations: relationTable,
      table: _i3.BusTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _buses!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        routeName,
        routeStartTime,
        startlatitude,
        startlongitude,
        routeEndTime,
        endlatitude,
        endlongitude,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'stops') {
      return __stops;
    }
    if (relationField == 'buses') {
      return __buses;
    }
    return null;
  }
}

class RoutesInclude extends _i1.IncludeObject {
  RoutesInclude._({
    _i2.StopIncludeList? stops,
    _i3.BusIncludeList? buses,
  }) {
    _stops = stops;
    _buses = buses;
  }

  _i2.StopIncludeList? _stops;

  _i3.BusIncludeList? _buses;

  @override
  Map<String, _i1.Include?> get includes => {
        'stops': _stops,
        'buses': _buses,
      };

  @override
  _i1.Table get table => Routes.t;
}

class RoutesIncludeList extends _i1.IncludeList {
  RoutesIncludeList._({
    _i1.WhereExpressionBuilder<RoutesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Routes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Routes.t;
}

class RoutesRepository {
  const RoutesRepository._();

  final attach = const RoutesAttachRepository._();

  final attachRow = const RoutesAttachRowRepository._();

  final detach = const RoutesDetachRepository._();

  final detachRow = const RoutesDetachRowRepository._();

  Future<List<Routes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoutesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoutesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoutesTable>? orderByList,
    _i1.Transaction? transaction,
    RoutesInclude? include,
  }) async {
    return session.db.find<Routes>(
      where: where?.call(Routes.t),
      orderBy: orderBy?.call(Routes.t),
      orderByList: orderByList?.call(Routes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Routes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoutesTable>? where,
    int? offset,
    _i1.OrderByBuilder<RoutesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoutesTable>? orderByList,
    _i1.Transaction? transaction,
    RoutesInclude? include,
  }) async {
    return session.db.findFirstRow<Routes>(
      where: where?.call(Routes.t),
      orderBy: orderBy?.call(Routes.t),
      orderByList: orderByList?.call(Routes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Routes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RoutesInclude? include,
  }) async {
    return session.db.findById<Routes>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Routes>> insert(
    _i1.Session session,
    List<Routes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Routes>(
      rows,
      transaction: transaction,
    );
  }

  Future<Routes> insertRow(
    _i1.Session session,
    Routes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Routes>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Routes>> update(
    _i1.Session session,
    List<Routes> rows, {
    _i1.ColumnSelections<RoutesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Routes>(
      rows,
      columns: columns?.call(Routes.t),
      transaction: transaction,
    );
  }

  Future<Routes> updateRow(
    _i1.Session session,
    Routes row, {
    _i1.ColumnSelections<RoutesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Routes>(
      row,
      columns: columns?.call(Routes.t),
      transaction: transaction,
    );
  }

  Future<List<Routes>> delete(
    _i1.Session session,
    List<Routes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Routes>(
      rows,
      transaction: transaction,
    );
  }

  Future<Routes> deleteRow(
    _i1.Session session,
    Routes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Routes>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Routes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RoutesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Routes>(
      where: where(Routes.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoutesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Routes>(
      where: where?.call(Routes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RoutesAttachRepository {
  const RoutesAttachRepository._();

  Future<void> stops(
    _i1.Session session,
    Routes routes,
    List<_i2.Stop> stop, {
    _i1.Transaction? transaction,
  }) async {
    if (stop.any((e) => e.id == null)) {
      throw ArgumentError.notNull('stop.id');
    }
    if (routes.id == null) {
      throw ArgumentError.notNull('routes.id');
    }

    var $stop = stop.map((e) => e.copyWith(routeID: routes.id)).toList();
    await session.db.update<_i2.Stop>(
      $stop,
      columns: [_i2.Stop.t.routeID],
      transaction: transaction,
    );
  }

  Future<void> buses(
    _i1.Session session,
    Routes routes,
    List<_i3.Bus> bus, {
    _i1.Transaction? transaction,
  }) async {
    if (bus.any((e) => e.id == null)) {
      throw ArgumentError.notNull('bus.id');
    }
    if (routes.id == null) {
      throw ArgumentError.notNull('routes.id');
    }

    var $bus = bus.map((e) => e.copyWith(routeID: routes.id)).toList();
    await session.db.update<_i3.Bus>(
      $bus,
      columns: [_i3.Bus.t.routeID],
      transaction: transaction,
    );
  }
}

class RoutesAttachRowRepository {
  const RoutesAttachRowRepository._();

  Future<void> stops(
    _i1.Session session,
    Routes routes,
    _i2.Stop stop, {
    _i1.Transaction? transaction,
  }) async {
    if (stop.id == null) {
      throw ArgumentError.notNull('stop.id');
    }
    if (routes.id == null) {
      throw ArgumentError.notNull('routes.id');
    }

    var $stop = stop.copyWith(routeID: routes.id);
    await session.db.updateRow<_i2.Stop>(
      $stop,
      columns: [_i2.Stop.t.routeID],
      transaction: transaction,
    );
  }

  Future<void> buses(
    _i1.Session session,
    Routes routes,
    _i3.Bus bus, {
    _i1.Transaction? transaction,
  }) async {
    if (bus.id == null) {
      throw ArgumentError.notNull('bus.id');
    }
    if (routes.id == null) {
      throw ArgumentError.notNull('routes.id');
    }

    var $bus = bus.copyWith(routeID: routes.id);
    await session.db.updateRow<_i3.Bus>(
      $bus,
      columns: [_i3.Bus.t.routeID],
      transaction: transaction,
    );
  }
}

class RoutesDetachRepository {
  const RoutesDetachRepository._();

  Future<void> buses(
    _i1.Session session,
    List<_i3.Bus> bus, {
    _i1.Transaction? transaction,
  }) async {
    if (bus.any((e) => e.id == null)) {
      throw ArgumentError.notNull('bus.id');
    }

    var $bus = bus.map((e) => e.copyWith(routeID: null)).toList();
    await session.db.update<_i3.Bus>(
      $bus,
      columns: [_i3.Bus.t.routeID],
      transaction: transaction,
    );
  }
}

class RoutesDetachRowRepository {
  const RoutesDetachRowRepository._();

  Future<void> buses(
    _i1.Session session,
    _i3.Bus bus, {
    _i1.Transaction? transaction,
  }) async {
    if (bus.id == null) {
      throw ArgumentError.notNull('bus.id');
    }

    var $bus = bus.copyWith(routeID: null);
    await session.db.updateRow<_i3.Bus>(
      $bus,
      columns: [_i3.Bus.t.routeID],
      transaction: transaction,
    );
  }
}
