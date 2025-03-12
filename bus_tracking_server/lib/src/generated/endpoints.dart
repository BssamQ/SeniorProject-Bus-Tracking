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
import '../endpoints/bus_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/gps_data_endpoint.dart' as _i4;
import '../endpoints/notification_endpoint.dart' as _i5;
import '../endpoints/route_endpoint.dart' as _i6;
import '../endpoints/station_endpoint.dart' as _i7;
import '../endpoints/stop_endpoint.dart' as _i8;
import '../endpoints/user_endpoint.dart' as _i9;
import 'package:bus_tracking_server/src/generated/bus_class.dart' as _i10;
import 'package:bus_tracking_server/src/generated/gps_data_class.dart' as _i11;
import 'package:bus_tracking_server/src/generated/notifications_class.dart'
    as _i12;
import 'package:bus_tracking_server/src/generated/route_class.dart' as _i13;
import 'package:bus_tracking_server/src/generated/stations.dart' as _i14;
import 'package:bus_tracking_server/src/generated/stop_class.dart' as _i15;
import 'package:bus_tracking_server/src/generated/user_class.dart' as _i16;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i17;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'bus': _i2.BusEndpoint()
        ..initialize(
          server,
          'bus',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'gPSData': _i4.GPSDataEndpoint()
        ..initialize(
          server,
          'gPSData',
          null,
        ),
      'notification': _i5.NotificationEndpoint()
        ..initialize(
          server,
          'notification',
          null,
        ),
      'route': _i6.RouteEndpoint()
        ..initialize(
          server,
          'route',
          null,
        ),
      'station': _i7.StationEndpoint()
        ..initialize(
          server,
          'station',
          null,
        ),
      'stop': _i8.StopEndpoint()
        ..initialize(
          server,
          'stop',
          null,
        ),
      'user': _i9.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['bus'] = _i1.EndpointConnector(
      name: 'bus',
      endpoint: endpoints['bus']!,
      methodConnectors: {
        'getBusById': _i1.MethodConnector(
          name: 'getBusById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint).getBusById(
            session,
            params['id'],
          ),
        ),
        'getAllBuses': _i1.MethodConnector(
          name: 'getAllBuses',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint).getAllBuses(session),
        ),
        'addBus': _i1.MethodConnector(
          name: 'addBus',
          params: {
            'bus': _i1.ParameterDescription(
              name: 'bus',
              type: _i1.getType<_i10.Bus>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint).addBus(
            session,
            params['bus'],
          ),
        ),
        'updateBus': _i1.MethodConnector(
          name: 'updateBus',
          params: {
            'bus': _i1.ParameterDescription(
              name: 'bus',
              type: _i1.getType<_i10.Bus>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint).updateBus(
            session,
            params['bus'],
          ),
        ),
        'deleteBus': _i1.MethodConnector(
          name: 'deleteBus',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint).deleteBus(
            session,
            params['id'],
          ),
        ),
        'getBusesByAgeGroup1': _i1.MethodConnector(
          name: 'getBusesByAgeGroup1',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint)
                  .getBusesByAgeGroup1(session),
        ),
        'getBusesByAgeGroup2': _i1.MethodConnector(
          name: 'getBusesByAgeGroup2',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint)
                  .getBusesByAgeGroup2(session),
        ),
        'getBusesByAgeGroup3': _i1.MethodConnector(
          name: 'getBusesByAgeGroup3',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint)
                  .getBusesByAgeGroup3(session),
        ),
        'getBusesByStatusOperating': _i1.MethodConnector(
          name: 'getBusesByStatusOperating',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint)
                  .getBusesByStatusOperating(session),
        ),
        'getBusesByStatusInMaintenance': _i1.MethodConnector(
          name: 'getBusesByStatusInMaintenance',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint)
                  .getBusesByStatusInMaintenance(session),
        ),
        'getBusesByStatusOutOfService': _i1.MethodConnector(
          name: 'getBusesByStatusOutOfService',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint)
                  .getBusesByStatusOutOfService(session),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['gPSData'] = _i1.EndpointConnector(
      name: 'gPSData',
      endpoint: endpoints['gPSData']!,
      methodConnectors: {
        'getGPSDataByBusId': _i1.MethodConnector(
          name: 'getGPSDataByBusId',
          params: {
            'busId': _i1.ParameterDescription(
              name: 'busId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gPSData'] as _i4.GPSDataEndpoint).getGPSDataByBusId(
            session,
            params['busId'],
          ),
        ),
        'addGPSData': _i1.MethodConnector(
          name: 'addGPSData',
          params: {
            'gpsData': _i1.ParameterDescription(
              name: 'gpsData',
              type: _i1.getType<_i11.GPSData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gPSData'] as _i4.GPSDataEndpoint).addGPSData(
            session,
            params['gpsData'],
          ),
        ),
        'deleteGPSData': _i1.MethodConnector(
          name: 'deleteGPSData',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gPSData'] as _i4.GPSDataEndpoint).deleteGPSData(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['notification'] = _i1.EndpointConnector(
      name: 'notification',
      endpoint: endpoints['notification']!,
      methodConnectors: {
        'getNotificationsByUserId': _i1.MethodConnector(
          name: 'getNotificationsByUserId',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .getNotificationsByUserId(
            session,
            params['userId'],
          ),
        ),
        'addNotification': _i1.MethodConnector(
          name: 'addNotification',
          params: {
            'notification': _i1.ParameterDescription(
              name: 'notification',
              type: _i1.getType<_i12.Notification>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .addNotification(
            session,
            params['notification'],
          ),
        ),
        'markNotificationAsRead': _i1.MethodConnector(
          name: 'markNotificationAsRead',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .markNotificationAsRead(
            session,
            params['notificationId'],
          ),
        ),
        'deleteNotification': _i1.MethodConnector(
          name: 'deleteNotification',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .deleteNotification(
            session,
            params['notificationId'],
          ),
        ),
      },
    );
    connectors['route'] = _i1.EndpointConnector(
      name: 'route',
      endpoint: endpoints['route']!,
      methodConnectors: {
        'getRouteById': _i1.MethodConnector(
          name: 'getRouteById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint).getRouteById(
            session,
            params['id'],
          ),
        ),
        'getAllRoutes': _i1.MethodConnector(
          name: 'getAllRoutes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint).getAllRoutes(session),
        ),
        'addRoute': _i1.MethodConnector(
          name: 'addRoute',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<_i13.Routes>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint).addRoute(
            session,
            params['route'],
          ),
        ),
        'updateRoute': _i1.MethodConnector(
          name: 'updateRoute',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<_i13.Routes>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint).updateRoute(
            session,
            params['route'],
          ),
        ),
        'deleteRoute': _i1.MethodConnector(
          name: 'deleteRoute',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint).deleteRoute(
            session,
            params['id'],
          ),
        ),
        'getRouteNameById': _i1.MethodConnector(
          name: 'getRouteNameById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint).getRouteNameById(
            session,
            params['id'],
          ),
        ),
        'getAllRouteNames': _i1.MethodConnector(
          name: 'getAllRouteNames',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint)
                  .getAllRouteNames(session),
        ),
        'getRoutesByLocation': _i1.MethodConnector(
          name: 'getRoutesByLocation',
          params: {
            'startLatitude': _i1.ParameterDescription(
              name: 'startLatitude',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'startLongitude': _i1.ParameterDescription(
              name: 'startLongitude',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'endLatitude': _i1.ParameterDescription(
              name: 'endLatitude',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'endLongitude': _i1.ParameterDescription(
              name: 'endLongitude',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint).getRoutesByLocation(
            session,
            params['startLatitude'],
            params['startLongitude'],
            params['endLatitude'],
            params['endLongitude'],
          ),
        ),
        'updateRouteStartTime': _i1.MethodConnector(
          name: 'updateRouteStartTime',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newStartTime': _i1.ParameterDescription(
              name: 'newStartTime',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i6.RouteEndpoint).updateRouteStartTime(
            session,
            params['routeId'],
            params['newStartTime'],
          ),
        ),
      },
    );
    connectors['station'] = _i1.EndpointConnector(
      name: 'station',
      endpoint: endpoints['station']!,
      methodConnectors: {
        'getStationById': _i1.MethodConnector(
          name: 'getStationById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['station'] as _i7.StationEndpoint).getStationById(
            session,
            id: params['id'],
          ),
        ),
        'addStation': _i1.MethodConnector(
          name: 'addStation',
          params: {
            'station': _i1.ParameterDescription(
              name: 'station',
              type: _i1.getType<_i14.Station>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['station'] as _i7.StationEndpoint).addStation(
            session,
            params['station'],
          ),
        ),
        'deleteStationById': _i1.MethodConnector(
          name: 'deleteStationById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['station'] as _i7.StationEndpoint).deleteStationById(
            session,
            id: params['id'],
          ),
        ),
        'searchStationsByName': _i1.MethodConnector(
          name: 'searchStationsByName',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['station'] as _i7.StationEndpoint)
                  .searchStationsByName(
            session,
            name: params['name'],
          ),
        ),
        'updateStation': _i1.MethodConnector(
          name: 'updateStation',
          params: {
            'station': _i1.ParameterDescription(
              name: 'station',
              type: _i1.getType<_i14.Station>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['station'] as _i7.StationEndpoint).updateStation(
            session,
            params['station'],
          ),
        ),
        'getAllStations': _i1.MethodConnector(
          name: 'getAllStations',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['station'] as _i7.StationEndpoint)
                  .getAllStations(session),
        ),
      },
    );
    connectors['stop'] = _i1.EndpointConnector(
      name: 'stop',
      endpoint: endpoints['stop']!,
      methodConnectors: {
        'getStopById': _i1.MethodConnector(
          name: 'getStopById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stop'] as _i8.StopEndpoint).getStopById(
            session,
            params['id'],
          ),
        ),
        'getAllStops': _i1.MethodConnector(
          name: 'getAllStops',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stop'] as _i8.StopEndpoint).getAllStops(session),
        ),
        'addStop': _i1.MethodConnector(
          name: 'addStop',
          params: {
            'stop': _i1.ParameterDescription(
              name: 'stop',
              type: _i1.getType<_i15.Stop>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stop'] as _i8.StopEndpoint).addStop(
            session,
            params['stop'],
          ),
        ),
        'updateStop': _i1.MethodConnector(
          name: 'updateStop',
          params: {
            'stop': _i1.ParameterDescription(
              name: 'stop',
              type: _i1.getType<_i15.Stop>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stop'] as _i8.StopEndpoint).updateStop(
            session,
            params['stop'],
          ),
        ),
        'deleteStop': _i1.MethodConnector(
          name: 'deleteStop',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stop'] as _i8.StopEndpoint).deleteStop(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).getUserById(
            session,
            id: params['id'],
          ),
        ),
        'addUser': _i1.MethodConnector(
          name: 'addUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).addUser(
            session,
            params['user'],
          ),
        ),
        'updateUser': _i1.MethodConnector(
          name: 'updateUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).updateUser(
            session,
            params['user'],
          ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).deleteUser(
            session,
            params['id'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).login(
            session,
            params['email'],
            params['password'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i17.Endpoints()..initializeEndpoints(server);
  }
}
