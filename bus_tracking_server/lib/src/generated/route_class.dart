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

abstract class Route implements _i1.TableRow, _i1.ProtocolSerialization {
  Route._({
    this.id,
    required this.routeName,
    this.stops,
    required this.routeStartTime,
    required this.startPoint,
    required this.routeEndTime,
    required this.endPoint,
    this.createdAt,
    this.buses,
  });

  factory Route({
    int? id,
    required String routeName,
    List<_i2.Stop>? stops,
    required String routeStartTime,
    required String startPoint,
    required String routeEndTime,
    required String endPoint,
    DateTime? createdAt,
    List<_i3.Bus>? buses,
  }) = _RouteImpl;

  factory Route.fromJson(Map<String, dynamic> jsonSerialization) {
    return Route(
      id: jsonSerialization['id'] as int?,
      routeName: jsonSerialization['routeName'] as String,
      stops: (jsonSerialization['stops'] as List?)
          ?.map((e) => _i2.Stop.fromJson((e as Map<String, dynamic>)))
          .toList(),
      routeStartTime: jsonSerialization['routeStartTime'] as String,
      startPoint: jsonSerialization['startPoint'] as String,
      routeEndTime: jsonSerialization['routeEndTime'] as String,
      endPoint: jsonSerialization['endPoint'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      buses: (jsonSerialization['buses'] as List?)
          ?.map((e) => _i3.Bus.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = RouteTable();

  static const db = RouteRepository._();

  @override
  int? id;

  String routeName;

  List<_i2.Stop>? stops;

  String routeStartTime;

  String startPoint;

  String routeEndTime;

  String endPoint;

  DateTime? createdAt;

  List<_i3.Bus>? buses;

  @override
  _i1.Table get table => t;

  Route copyWith({
    int? id,
    String? routeName,
    List<_i2.Stop>? stops,
    String? routeStartTime,
    String? startPoint,
    String? routeEndTime,
    String? endPoint,
    DateTime? createdAt,
    List<_i3.Bus>? buses,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'routeName': routeName,
      if (stops != null) 'stops': stops?.toJson(valueToJson: (v) => v.toJson()),
      'routeStartTime': routeStartTime,
      'startPoint': startPoint,
      'routeEndTime': routeEndTime,
      'endPoint': endPoint,
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
      'routeStartTime': routeStartTime,
      'startPoint': startPoint,
      'routeEndTime': routeEndTime,
      'endPoint': endPoint,
      if (buses != null)
        'buses': buses?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static RouteInclude include({
    _i2.StopIncludeList? stops,
    _i3.BusIncludeList? buses,
  }) {
    return RouteInclude._(
      stops: stops,
      buses: buses,
    );
  }

  static RouteIncludeList includeList({
    _i1.WhereExpressionBuilder<RouteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteTable>? orderByList,
    RouteInclude? include,
  }) {
    return RouteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Route.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Route.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RouteImpl extends Route {
  _RouteImpl({
    int? id,
    required String routeName,
    List<_i2.Stop>? stops,
    required String routeStartTime,
    required String startPoint,
    required String routeEndTime,
    required String endPoint,
    DateTime? createdAt,
    List<_i3.Bus>? buses,
  }) : super._(
          id: id,
          routeName: routeName,
          stops: stops,
          routeStartTime: routeStartTime,
          startPoint: startPoint,
          routeEndTime: routeEndTime,
          endPoint: endPoint,
          createdAt: createdAt,
          buses: buses,
        );

  @override
  Route copyWith({
    Object? id = _Undefined,
    String? routeName,
    Object? stops = _Undefined,
    String? routeStartTime,
    String? startPoint,
    String? routeEndTime,
    String? endPoint,
    Object? createdAt = _Undefined,
    Object? buses = _Undefined,
  }) {
    return Route(
      id: id is int? ? id : this.id,
      routeName: routeName ?? this.routeName,
      stops: stops is List<_i2.Stop>?
          ? stops
          : this.stops?.map((e0) => e0.copyWith()).toList(),
      routeStartTime: routeStartTime ?? this.routeStartTime,
      startPoint: startPoint ?? this.startPoint,
      routeEndTime: routeEndTime ?? this.routeEndTime,
      endPoint: endPoint ?? this.endPoint,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      buses: buses is List<_i3.Bus>?
          ? buses
          : this.buses?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class RouteTable extends _i1.Table {
  RouteTable({super.tableRelation}) : super(tableName: 'route') {
    routeName = _i1.ColumnString(
      'routeName',
      this,
    );
    routeStartTime = _i1.ColumnString(
      'routeStartTime',
      this,
    );
    startPoint = _i1.ColumnString(
      'startPoint',
      this,
    );
    routeEndTime = _i1.ColumnString(
      'routeEndTime',
      this,
    );
    endPoint = _i1.ColumnString(
      'endPoint',
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

  late final _i1.ColumnString startPoint;

  late final _i1.ColumnString routeEndTime;

  late final _i1.ColumnString endPoint;

  late final _i1.ColumnDateTime createdAt;

  _i3.BusTable? ___buses;

  _i1.ManyRelation<_i3.BusTable>? _buses;

  _i2.StopTable get __stops {
    if (___stops != null) return ___stops!;
    ___stops = _i1.createRelationTable(
      relationFieldName: '__stops',
      field: Route.t.id,
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
      field: Route.t.id,
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
      field: Route.t.id,
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
      field: Route.t.id,
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
        startPoint,
        routeEndTime,
        endPoint,
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

class RouteInclude extends _i1.IncludeObject {
  RouteInclude._({
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
  _i1.Table get table => Route.t;
}

class RouteIncludeList extends _i1.IncludeList {
  RouteIncludeList._({
    _i1.WhereExpressionBuilder<RouteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Route.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Route.t;
}

class RouteRepository {
  const RouteRepository._();

  final attach = const RouteAttachRepository._();

  final attachRow = const RouteAttachRowRepository._();

  final detach = const RouteDetachRepository._();

  final detachRow = const RouteDetachRowRepository._();

  Future<List<Route>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RouteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteTable>? orderByList,
    _i1.Transaction? transaction,
    RouteInclude? include,
  }) async {
    return session.db.find<Route>(
      where: where?.call(Route.t),
      orderBy: orderBy?.call(Route.t),
      orderByList: orderByList?.call(Route.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Route?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteTable>? where,
    int? offset,
    _i1.OrderByBuilder<RouteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RouteTable>? orderByList,
    _i1.Transaction? transaction,
    RouteInclude? include,
  }) async {
    return session.db.findFirstRow<Route>(
      where: where?.call(Route.t),
      orderBy: orderBy?.call(Route.t),
      orderByList: orderByList?.call(Route.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Route?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RouteInclude? include,
  }) async {
    return session.db.findById<Route>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Route>> insert(
    _i1.Session session,
    List<Route> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Route>(
      rows,
      transaction: transaction,
    );
  }

  Future<Route> insertRow(
    _i1.Session session,
    Route row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Route>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Route>> update(
    _i1.Session session,
    List<Route> rows, {
    _i1.ColumnSelections<RouteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Route>(
      rows,
      columns: columns?.call(Route.t),
      transaction: transaction,
    );
  }

  Future<Route> updateRow(
    _i1.Session session,
    Route row, {
    _i1.ColumnSelections<RouteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Route>(
      row,
      columns: columns?.call(Route.t),
      transaction: transaction,
    );
  }

  Future<List<Route>> delete(
    _i1.Session session,
    List<Route> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Route>(
      rows,
      transaction: transaction,
    );
  }

  Future<Route> deleteRow(
    _i1.Session session,
    Route row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Route>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Route>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RouteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Route>(
      where: where(Route.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RouteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Route>(
      where: where?.call(Route.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RouteAttachRepository {
  const RouteAttachRepository._();

  Future<void> stops(
    _i1.Session session,
    Route route,
    List<_i2.Stop> stop, {
    _i1.Transaction? transaction,
  }) async {
    if (stop.any((e) => e.id == null)) {
      throw ArgumentError.notNull('stop.id');
    }
    if (route.id == null) {
      throw ArgumentError.notNull('route.id');
    }

    var $stop = stop.map((e) => e.copyWith(routeID: route.id)).toList();
    await session.db.update<_i2.Stop>(
      $stop,
      columns: [_i2.Stop.t.routeID],
      transaction: transaction,
    );
  }

  Future<void> buses(
    _i1.Session session,
    Route route,
    List<_i3.Bus> bus, {
    _i1.Transaction? transaction,
  }) async {
    if (bus.any((e) => e.id == null)) {
      throw ArgumentError.notNull('bus.id');
    }
    if (route.id == null) {
      throw ArgumentError.notNull('route.id');
    }

    var $bus = bus.map((e) => e.copyWith(routeID: route.id)).toList();
    await session.db.update<_i3.Bus>(
      $bus,
      columns: [_i3.Bus.t.routeID],
      transaction: transaction,
    );
  }
}

class RouteAttachRowRepository {
  const RouteAttachRowRepository._();

  Future<void> stops(
    _i1.Session session,
    Route route,
    _i2.Stop stop, {
    _i1.Transaction? transaction,
  }) async {
    if (stop.id == null) {
      throw ArgumentError.notNull('stop.id');
    }
    if (route.id == null) {
      throw ArgumentError.notNull('route.id');
    }

    var $stop = stop.copyWith(routeID: route.id);
    await session.db.updateRow<_i2.Stop>(
      $stop,
      columns: [_i2.Stop.t.routeID],
      transaction: transaction,
    );
  }

  Future<void> buses(
    _i1.Session session,
    Route route,
    _i3.Bus bus, {
    _i1.Transaction? transaction,
  }) async {
    if (bus.id == null) {
      throw ArgumentError.notNull('bus.id');
    }
    if (route.id == null) {
      throw ArgumentError.notNull('route.id');
    }

    var $bus = bus.copyWith(routeID: route.id);
    await session.db.updateRow<_i3.Bus>(
      $bus,
      columns: [_i3.Bus.t.routeID],
      transaction: transaction,
    );
  }
}

class RouteDetachRepository {
  const RouteDetachRepository._();

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

class RouteDetachRowRepository {
  const RouteDetachRowRepository._();

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
