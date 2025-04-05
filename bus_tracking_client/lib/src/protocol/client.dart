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
import 'package:bus_tracking_client/src/protocol/driver_class.dart' as _i4;
import 'package:bus_tracking_client/src/protocol/gps_data_class.dart' as _i5;
import 'package:bus_tracking_client/src/protocol/notifications_class.dart'
    as _i6;
import 'package:bus_tracking_client/src/protocol/route_class.dart' as _i7;
import 'package:bus_tracking_client/src/protocol/stations.dart' as _i8;
import 'package:bus_tracking_client/src/protocol/stop_class.dart' as _i9;
import 'package:bus_tracking_client/src/protocol/user_class.dart' as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
import 'protocol.dart' as _i12;

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
class EndpointDriverInfo extends _i1.EndpointRef {
  EndpointDriverInfo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'driverInfo';

  _i2.Future<_i4.DriverInfo> createDriver(_i4.DriverInfo driverInfo) =>
      caller.callServerEndpoint<_i4.DriverInfo>(
        'driverInfo',
        'createDriver',
        {'driverInfo': driverInfo},
      );

  _i2.Future<_i4.DriverInfo?> getDriverById(int id) =>
      caller.callServerEndpoint<_i4.DriverInfo?>(
        'driverInfo',
        'getDriverById',
        {'id': id},
      );

  _i2.Future<_i4.DriverInfo?> getDriverByUserInfoId(int userInfoId) =>
      caller.callServerEndpoint<_i4.DriverInfo?>(
        'driverInfo',
        'getDriverByUserInfoId',
        {'userInfoId': userInfoId},
      );

  _i2.Future<List<_i4.DriverInfo>> getAllDrivers() =>
      caller.callServerEndpoint<List<_i4.DriverInfo>>(
        'driverInfo',
        'getAllDrivers',
        {},
      );

  _i2.Future<_i4.DriverInfo?> getDriverForBus(int busId) =>
      caller.callServerEndpoint<_i4.DriverInfo?>(
        'driverInfo',
        'getDriverForBus',
        {'busId': busId},
      );

  _i2.Future<_i4.DriverInfo> updateDriver(_i4.DriverInfo driverInfo) =>
      caller.callServerEndpoint<_i4.DriverInfo>(
        'driverInfo',
        'updateDriver',
        {'driverInfo': driverInfo},
      );

  _i2.Future<bool> deleteDriver(int id) => caller.callServerEndpoint<bool>(
        'driverInfo',
        'deleteDriver',
        {'id': id},
      );

  _i2.Future<bool> assignBusToDiver(
    int driverId,
    int busId,
  ) =>
      caller.callServerEndpoint<bool>(
        'driverInfo',
        'assignBusToDiver',
        {
          'driverId': driverId,
          'busId': busId,
        },
      );

  _i2.Future<_i3.Bus?> getDriverBus(int driverInfoId) =>
      caller.callServerEndpoint<_i3.Bus?>(
        'driverInfo',
        'getDriverBus',
        {'driverInfoId': driverInfoId},
      );

  _i2.Future<String?> getDriverName(int userInfoId) =>
      caller.callServerEndpoint<String?>(
        'driverInfo',
        'getDriverName',
        {'userInfoId': userInfoId},
      );

  _i2.Future<String?> getDriverEmail(int driverInfoId) =>
      caller.callServerEndpoint<String?>(
        'driverInfo',
        'getDriverEmail',
        {'driverInfoId': driverInfoId},
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

  _i2.Future<List<_i5.GPSData>> getGPSDataByBusId(int busId) =>
      caller.callServerEndpoint<List<_i5.GPSData>>(
        'gPSData',
        'getGPSDataByBusId',
        {'busId': busId},
      );

  _i2.Future<bool> addGPSData(_i5.GPSData gpsData) =>
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

  _i2.Future<List<_i6.Notification>> getNotificationsByUserId(int userId) =>
      caller.callServerEndpoint<List<_i6.Notification>>(
        'notification',
        'getNotificationsByUserId',
        {'userId': userId},
      );

  _i2.Future<bool> addNotification(_i6.Notification notification) =>
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

  _i2.Future<_i7.Routes?> getRouteById(int id) =>
      caller.callServerEndpoint<_i7.Routes?>(
        'route',
        'getRouteById',
        {'id': id},
      );

  _i2.Future<List<_i7.Routes>> getAllRoutes() =>
      caller.callServerEndpoint<List<_i7.Routes>>(
        'route',
        'getAllRoutes',
        {},
      );

  _i2.Future<bool> addRoute(_i7.Routes route) =>
      caller.callServerEndpoint<bool>(
        'route',
        'addRoute',
        {'route': route},
      );

  _i2.Future<bool> updateRoute(_i7.Routes route) =>
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

  _i2.Future<List<_i7.Routes>> getRoutesByLocation(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) =>
      caller.callServerEndpoint<List<_i7.Routes>>(
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

  _i2.Future<_i8.Station?> getStationById({required int id}) =>
      caller.callServerEndpoint<_i8.Station?>(
        'station',
        'getStationById',
        {'id': id},
      );

  _i2.Future<_i8.Station> addStation(_i8.Station station) =>
      caller.callServerEndpoint<_i8.Station>(
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

  _i2.Future<List<_i8.Station>> searchStationsByName({required String name}) =>
      caller.callServerEndpoint<List<_i8.Station>>(
        'station',
        'searchStationsByName',
        {'name': name},
      );

  _i2.Future<_i8.Station?> updateStation(_i8.Station station) =>
      caller.callServerEndpoint<_i8.Station?>(
        'station',
        'updateStation',
        {'station': station},
      );

  _i2.Future<List<_i8.Station>> getAllStations() =>
      caller.callServerEndpoint<List<_i8.Station>>(
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

  _i2.Future<_i9.Stop?> getStopById(int id) =>
      caller.callServerEndpoint<_i9.Stop?>(
        'stop',
        'getStopById',
        {'id': id},
      );

  _i2.Future<List<_i9.Stop>> getAllStops() =>
      caller.callServerEndpoint<List<_i9.Stop>>(
        'stop',
        'getAllStops',
        {},
      );

  _i2.Future<bool> addStop(_i9.Stop stop) => caller.callServerEndpoint<bool>(
        'stop',
        'addStop',
        {'stop': stop},
      );

  _i2.Future<bool> updateStop(_i9.Stop stop) => caller.callServerEndpoint<bool>(
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

  _i2.Future<_i10.User?> getUserById({int? id}) =>
      caller.callServerEndpoint<_i10.User?>(
        'user',
        'getUserById',
        {'id': id},
      );

  _i2.Future<bool> addUser(_i10.User user) => caller.callServerEndpoint<bool>(
        'user',
        'addUser',
        {'user': user},
      );

  _i2.Future<bool> updateUser(_i10.User user) =>
      caller.callServerEndpoint<bool>(
        'user',
        'updateUser',
        {'user': user},
      );

  _i2.Future<bool> deleteUser(int id) => caller.callServerEndpoint<bool>(
        'user',
        'deleteUser',
        {'id': id},
      );

  _i2.Future<String?> getUserRole() => caller.callServerEndpoint<String?>(
        'user',
        'getUserRole',
        {},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i11.Caller(client);
  }

  late final _i11.Caller auth;
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
          _i12.Protocol(),
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
    driverInfo = EndpointDriverInfo(this);
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

  late final EndpointDriverInfo driverInfo;

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
        'driverInfo': driverInfo,
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
