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
import 'dart:async' as _i2;
import 'package:bus_tracking_client/src/protocol/bus_class.dart' as _i3;
import 'package:bus_tracking_client/src/protocol/gps_data_class.dart' as _i4;
import 'package:bus_tracking_client/src/protocol/notifications_class.dart'
    as _i5;
import 'package:bus_tracking_client/src/protocol/route_class.dart' as _i6;
import 'package:bus_tracking_client/src/protocol/stations.dart' as _i7;
import 'package:bus_tracking_client/src/protocol/stop_class.dart' as _i8;
import 'package:bus_tracking_client/src/protocol/user_class.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
import 'protocol.dart' as _i11;

/// {@category Endpoint}
class EndpointBus extends _i1.EndpointRef {
  EndpointBus(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'bus';

  _i2.Future<_i3.Bus?> getBusById(int id) =>
      caller.callServerEndpoint<_i3.Bus?>(
        'bus',
        'getBusById',
        {'id': id},
      );

  _i2.Future<List<_i3.Bus>> getAllBuses() =>
      caller.callServerEndpoint<List<_i3.Bus>>(
        'bus',
        'getAllBuses',
        {},
      );

  _i2.Future<bool> addBus(_i3.Bus bus) => caller.callServerEndpoint<bool>(
        'bus',
        'addBus',
        {'bus': bus},
      );

  _i2.Future<bool> updateBus(_i3.Bus bus) => caller.callServerEndpoint<bool>(
        'bus',
        'updateBus',
        {'bus': bus},
      );

  _i2.Future<bool> deleteBus(int id) => caller.callServerEndpoint<bool>(
        'bus',
        'deleteBus',
        {'id': id},
      );

  _i2.Future<List<_i3.Bus>> getBusesByAgeGroup1() =>
      caller.callServerEndpoint<List<_i3.Bus>>(
        'bus',
        'getBusesByAgeGroup1',
        {},
      );

  _i2.Future<List<_i3.Bus>> getBusesByAgeGroup2() =>
      caller.callServerEndpoint<List<_i3.Bus>>(
        'bus',
        'getBusesByAgeGroup2',
        {},
      );

  _i2.Future<List<_i3.Bus>> getBusesByAgeGroup3() =>
      caller.callServerEndpoint<List<_i3.Bus>>(
        'bus',
        'getBusesByAgeGroup3',
        {},
      );

  _i2.Future<List<_i3.Bus>> getBusesByStatusOperating() =>
      caller.callServerEndpoint<List<_i3.Bus>>(
        'bus',
        'getBusesByStatusOperating',
        {},
      );

  _i2.Future<List<_i3.Bus>> getBusesByStatusInMaintenance() =>
      caller.callServerEndpoint<List<_i3.Bus>>(
        'bus',
        'getBusesByStatusInMaintenance',
        {},
      );

  _i2.Future<List<_i3.Bus>> getBusesByStatusOutOfService() =>
      caller.callServerEndpoint<List<_i3.Bus>>(
        'bus',
        'getBusesByStatusOutOfService',
        {},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointGPSData extends _i1.EndpointRef {
  EndpointGPSData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'gPSData';

  _i2.Future<List<_i4.GPSData>> getGPSDataByBusId(int busId) =>
      caller.callServerEndpoint<List<_i4.GPSData>>(
        'gPSData',
        'getGPSDataByBusId',
        {'busId': busId},
      );

  _i2.Future<bool> addGPSData(_i4.GPSData gpsData) =>
      caller.callServerEndpoint<bool>(
        'gPSData',
        'addGPSData',
        {'gpsData': gpsData},
      );

  _i2.Future<bool> deleteGPSData(int id) => caller.callServerEndpoint<bool>(
        'gPSData',
        'deleteGPSData',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointNotification extends _i1.EndpointRef {
  EndpointNotification(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notification';

  _i2.Future<List<_i5.Notification>> getNotificationsByUserId(int userId) =>
      caller.callServerEndpoint<List<_i5.Notification>>(
        'notification',
        'getNotificationsByUserId',
        {'userId': userId},
      );

  _i2.Future<bool> addNotification(_i5.Notification notification) =>
      caller.callServerEndpoint<bool>(
        'notification',
        'addNotification',
        {'notification': notification},
      );

  _i2.Future<bool> markNotificationAsRead(int notificationId) =>
      caller.callServerEndpoint<bool>(
        'notification',
        'markNotificationAsRead',
        {'notificationId': notificationId},
      );

  _i2.Future<bool> deleteNotification(int notificationId) =>
      caller.callServerEndpoint<bool>(
        'notification',
        'deleteNotification',
        {'notificationId': notificationId},
      );
}

/// {@category Endpoint}
class EndpointRoute extends _i1.EndpointRef {
  EndpointRoute(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'route';

  _i2.Future<_i6.Routes?> getRouteById(int id) =>
      caller.callServerEndpoint<_i6.Routes?>(
        'route',
        'getRouteById',
        {'id': id},
      );

  _i2.Future<List<_i6.Routes>> getAllRoutes() =>
      caller.callServerEndpoint<List<_i6.Routes>>(
        'route',
        'getAllRoutes',
        {},
      );

  _i2.Future<bool> addRoute(_i6.Routes route) =>
      caller.callServerEndpoint<bool>(
        'route',
        'addRoute',
        {'route': route},
      );

  _i2.Future<bool> updateRoute(_i6.Routes route) =>
      caller.callServerEndpoint<bool>(
        'route',
        'updateRoute',
        {'route': route},
      );

  _i2.Future<bool> deleteRoute(int id) => caller.callServerEndpoint<bool>(
        'route',
        'deleteRoute',
        {'id': id},
      );

  _i2.Future<String?> getRouteNameById(int id) =>
      caller.callServerEndpoint<String?>(
        'route',
        'getRouteNameById',
        {'id': id},
      );

  _i2.Future<List<String>> getAllRouteNames() =>
      caller.callServerEndpoint<List<String>>(
        'route',
        'getAllRouteNames',
        {},
      );

  _i2.Future<List<_i6.Routes>> getRoutesByLocation(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) =>
      caller.callServerEndpoint<List<_i6.Routes>>(
        'route',
        'getRoutesByLocation',
        {
          'startLatitude': startLatitude,
          'startLongitude': startLongitude,
          'endLatitude': endLatitude,
          'endLongitude': endLongitude,
        },
      );

  _i2.Future<bool> updateRouteStartTime(
    int routeId,
    String? newStartTime,
  ) =>
      caller.callServerEndpoint<bool>(
        'route',
        'updateRouteStartTime',
        {
          'routeId': routeId,
          'newStartTime': newStartTime,
        },
      );
}

/// {@category Endpoint}
class EndpointStation extends _i1.EndpointRef {
  EndpointStation(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'station';

  _i2.Future<_i7.Station?> getStationById({required int id}) =>
      caller.callServerEndpoint<_i7.Station?>(
        'station',
        'getStationById',
        {'id': id},
      );

  _i2.Future<_i7.Station> addStation(_i7.Station station) =>
      caller.callServerEndpoint<_i7.Station>(
        'station',
        'addStation',
        {'station': station},
      );

  _i2.Future<bool> deleteStationById({required int id}) =>
      caller.callServerEndpoint<bool>(
        'station',
        'deleteStationById',
        {'id': id},
      );

  _i2.Future<List<_i7.Station>> searchStationsByName({required String name}) =>
      caller.callServerEndpoint<List<_i7.Station>>(
        'station',
        'searchStationsByName',
        {'name': name},
      );

  _i2.Future<_i7.Station?> updateStation(_i7.Station station) =>
      caller.callServerEndpoint<_i7.Station?>(
        'station',
        'updateStation',
        {'station': station},
      );

  _i2.Future<List<_i7.Station>> getAllStations() =>
      caller.callServerEndpoint<List<_i7.Station>>(
        'station',
        'getAllStations',
        {},
      );
}

/// {@category Endpoint}
class EndpointStop extends _i1.EndpointRef {
  EndpointStop(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'stop';

  _i2.Future<_i8.Stop?> getStopById(int id) =>
      caller.callServerEndpoint<_i8.Stop?>(
        'stop',
        'getStopById',
        {'id': id},
      );

  _i2.Future<List<_i8.Stop>> getAllStops() =>
      caller.callServerEndpoint<List<_i8.Stop>>(
        'stop',
        'getAllStops',
        {},
      );

  _i2.Future<bool> addStop(_i8.Stop stop) => caller.callServerEndpoint<bool>(
        'stop',
        'addStop',
        {'stop': stop},
      );

  _i2.Future<bool> updateStop(_i8.Stop stop) => caller.callServerEndpoint<bool>(
        'stop',
        'updateStop',
        {'stop': stop},
      );

  _i2.Future<bool> deleteStop(int id) => caller.callServerEndpoint<bool>(
        'stop',
        'deleteStop',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i9.User?> getUserById({int? id}) =>
      caller.callServerEndpoint<_i9.User?>(
        'user',
        'getUserById',
        {'id': id},
      );

  _i2.Future<bool> addUser(_i9.User user) => caller.callServerEndpoint<bool>(
        'user',
        'addUser',
        {'user': user},
      );

  _i2.Future<bool> updateUser(_i9.User user) => caller.callServerEndpoint<bool>(
        'user',
        'updateUser',
        {'user': user},
      );

  _i2.Future<bool> deleteUser(int id) => caller.callServerEndpoint<bool>(
        'user',
        'deleteUser',
        {'id': id},
      );

  _i2.Future<bool> login(
    String email,
    String password,
  ) =>
      caller.callServerEndpoint<bool>(
        'user',
        'login',
        {
          'email': email,
          'password': password,
        },
      );
}

class Modules {
  Modules(Client client) {
    auth = _i10.Caller(client);
  }

  late final _i10.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i11.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    bus = EndpointBus(this);
    example = EndpointExample(this);
    gPSData = EndpointGPSData(this);
    notification = EndpointNotification(this);
    route = EndpointRoute(this);
    station = EndpointStation(this);
    stop = EndpointStop(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointBus bus;

  late final EndpointExample example;

  late final EndpointGPSData gPSData;

  late final EndpointNotification notification;

  late final EndpointRoute route;

  late final EndpointStation station;

  late final EndpointStop stop;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'bus': bus,
        'example': example,
        'gPSData': gPSData,
        'notification': notification,
        'route': route,
        'station': station,
        'stop': stop,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
