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
import '../endpoints/driver_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/gps_data_endpoint.dart' as _i5;
import '../endpoints/notification_endpoint.dart' as _i6;
import '../endpoints/route_endpoint.dart' as _i7;
import '../endpoints/station_endpoint.dart' as _i8;
import '../endpoints/stop_endpoint.dart' as _i9;
import '../endpoints/user_endpoint.dart' as _i10;
import 'package:bus_tracking_server/src/generated/bus_class.dart' as _i11;
import 'package:bus_tracking_server/src/generated/driver_class.dart' as _i12;
import 'package:bus_tracking_server/src/generated/gps_data_class.dart' as _i13;
import 'package:bus_tracking_server/src/generated/notifications_class.dart'
    as _i14;
import 'package:bus_tracking_server/src/generated/route_class.dart' as _i15;
import 'package:bus_tracking_server/src/generated/stations.dart' as _i16;
import 'package:bus_tracking_server/src/generated/stop_class.dart' as _i17;
import 'package:bus_tracking_server/src/generated/user_class.dart' as _i18;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i19;

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
      'driverInfo': _i3.DriverInfoEndpoint()
        ..initialize(
          server,
          'driverInfo',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'gPSData': _i5.GPSDataEndpoint()
        ..initialize(
          server,
          'gPSData',
          null,
        ),
      'notification': _i6.NotificationEndpoint()
        ..initialize(
          server,
          'notification',
          null,
        ),
      'route': _i7.RouteEndpoint()
        ..initialize(
          server,
          'route',
          null,
        ),
      'station': _i8.StationEndpoint()
        ..initialize(
          server,
          'station',
          null,
        ),
      'stop': _i9.StopEndpoint()
        ..initialize(
          server,
          'stop',
          null,
        ),
      'user': _i10.UserEndpoint()
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
              type: _i1.getType<_i11.Bus>(),
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
              type: _i1.getType<_i11.Bus>(),
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
        'getAvailableOperatingBuses': _i1.MethodConnector(
          name: 'getAvailableOperatingBuses',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint)
                  .getAvailableOperatingBuses(session),
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
        'getUnassignedBuses': _i1.MethodConnector(
          name: 'getUnassignedBuses',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bus'] as _i2.BusEndpoint).getUnassignedBuses(session),
        ),
      },
    );
    connectors['driverInfo'] = _i1.EndpointConnector(
      name: 'driverInfo',
      endpoint: endpoints['driverInfo']!,
      methodConnectors: {
        'createDriver': _i1.MethodConnector(
          name: 'createDriver',
          params: {
            'driverInfo': _i1.ParameterDescription(
              name: 'driverInfo',
              type: _i1.getType<_i12.DriverInfo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint).createDriver(
            session,
            params['driverInfo'],
          ),
        ),
        'getDriverById': _i1.MethodConnector(
          name: 'getDriverById',
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
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint).getDriverById(
            session,
            params['id'],
          ),
        ),
        'getDriverByUserInfoId': _i1.MethodConnector(
          name: 'getDriverByUserInfoId',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint)
                  .getDriverByUserInfoId(
            session,
            params['userInfoId'],
          ),
        ),
        'getAllDrivers': _i1.MethodConnector(
          name: 'getAllDrivers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint)
                  .getAllDrivers(session),
        ),
        'getDriverForBus': _i1.MethodConnector(
          name: 'getDriverForBus',
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
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint)
                  .getDriverForBus(
            session,
            params['busId'],
          ),
        ),
        'updateDriver': _i1.MethodConnector(
          name: 'updateDriver',
          params: {
            'driverInfo': _i1.ParameterDescription(
              name: 'driverInfo',
              type: _i1.getType<_i12.DriverInfo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint).updateDriver(
            session,
            params['driverInfo'],
          ),
        ),
        'deleteDriver': _i1.MethodConnector(
          name: 'deleteDriver',
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
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint).deleteDriver(
            session,
            params['id'],
          ),
        ),
        'assignBusToDiver': _i1.MethodConnector(
          name: 'assignBusToDiver',
          params: {
            'driverId': _i1.ParameterDescription(
              name: 'driverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'busId': _i1.ParameterDescription(
              name: 'busId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint)
                  .assignBusToDiver(
            session,
            params['driverId'],
            params['busId'],
          ),
        ),
        'getDriverBus': _i1.MethodConnector(
          name: 'getDriverBus',
          params: {
            'driverInfoId': _i1.ParameterDescription(
              name: 'driverInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint).getDriverBus(
            session,
            params['driverInfoId'],
          ),
        ),
        'getDriverName': _i1.MethodConnector(
          name: 'getDriverName',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint).getDriverName(
            session,
            params['userInfoId'],
          ),
        ),
        'getDriverEmail': _i1.MethodConnector(
          name: 'getDriverEmail',
          params: {
            'driverInfoId': _i1.ParameterDescription(
              name: 'driverInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint)
                  .getDriverEmail(
            session,
            params['driverInfoId'],
          ),
        ),
        'getDriverByBusId': _i1.MethodConnector(
          name: 'getDriverByBusId',
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
              (endpoints['driverInfo'] as _i3.DriverInfoEndpoint)
                  .getDriverByBusId(
            session,
            params['busId'],
          ),
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
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
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
              (endpoints['gPSData'] as _i5.GPSDataEndpoint).getGPSDataByBusId(
            session,
            params['busId'],
          ),
        ),
        'addGPSData': _i1.MethodConnector(
          name: 'addGPSData',
          params: {
            'gpsData': _i1.ParameterDescription(
              name: 'gpsData',
              type: _i1.getType<_i13.GPSData>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['gPSData'] as _i5.GPSDataEndpoint).addGPSData(
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
              (endpoints['gPSData'] as _i5.GPSDataEndpoint).deleteGPSData(
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
              (endpoints['notification'] as _i6.NotificationEndpoint)
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
              type: _i1.getType<_i14.Notification>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i6.NotificationEndpoint)
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
              (endpoints['notification'] as _i6.NotificationEndpoint)
                  .markNotificationAsRead(
            session,
            params['notificationId'],
          ),
        ),
        'createEmergencyNotification': _i1.MethodConnector(
          name: 'createEmergencyNotification',
          params: {
            'driverId': _i1.ParameterDescription(
              name: 'driverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i6.NotificationEndpoint)
                  .createEmergencyNotification(
            session,
            params['driverId'],
            params['message'],
          ),
        ),
        'getNotificationsForDriver': _i1.MethodConnector(
          name: 'getNotificationsForDriver',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i6.NotificationEndpoint)
                  .getNotificationsForDriver(session),
        ),
        'markNotificationRead': _i1.MethodConnector(
          name: 'markNotificationRead',
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
              (endpoints['notification'] as _i6.NotificationEndpoint)
                  .markNotificationRead(
            session,
            params['notificationId'],
          ),
        ),
        'getAllNotifications': _i1.MethodConnector(
          name: 'getAllNotifications',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i6.NotificationEndpoint)
                  .getAllNotifications(session),
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
              (endpoints['notification'] as _i6.NotificationEndpoint)
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
              (endpoints['route'] as _i7.RouteEndpoint).getRouteById(
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
              (endpoints['route'] as _i7.RouteEndpoint).getAllRoutes(session),
        ),
        'addRoute': _i1.MethodConnector(
          name: 'addRoute',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<_i15.Routes>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i7.RouteEndpoint).addRoute(
            session,
            params['route'],
          ),
        ),
        'updateRoute': _i1.MethodConnector(
          name: 'updateRoute',
          params: {
            'route': _i1.ParameterDescription(
              name: 'route',
              type: _i1.getType<_i15.Routes>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i7.RouteEndpoint).updateRoute(
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
              (endpoints['route'] as _i7.RouteEndpoint).deleteRoute(
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
              (endpoints['route'] as _i7.RouteEndpoint).getRouteNameById(
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
              (endpoints['route'] as _i7.RouteEndpoint)
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
              (endpoints['route'] as _i7.RouteEndpoint).getRoutesByLocation(
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
              (endpoints['route'] as _i7.RouteEndpoint).updateRouteStartTime(
            session,
            params['routeId'],
            params['newStartTime'],
          ),
        ),
        'getBusesForRoute': _i1.MethodConnector(
          name: 'getBusesForRoute',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i7.RouteEndpoint).getBusesForRoute(
            session,
            params['routeId'],
          ),
        ),
        'assignRouteToBuses': _i1.MethodConnector(
          name: 'assignRouteToBuses',
          params: {
            'routeId': _i1.ParameterDescription(
              name: 'routeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'busIds': _i1.ParameterDescription(
              name: 'busIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i7.RouteEndpoint).assignRouteToBuses(
            session,
            params['routeId'],
            params['busIds'],
          ),
        ),
        'reassignBusesToRoute': _i1.MethodConnector(
          name: 'reassignBusesToRoute',
          params: {
            'newRouteId': _i1.ParameterDescription(
              name: 'newRouteId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'busIds': _i1.ParameterDescription(
              name: 'busIds',
              type: _i1.getType<Set<int>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['route'] as _i7.RouteEndpoint).reassignBusesToRoute(
            session,
            params['newRouteId'],
            params['busIds'],
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
              (endpoints['station'] as _i8.StationEndpoint).getStationById(
            session,
            id: params['id'],
          ),
        ),
        'addStation': _i1.MethodConnector(
          name: 'addStation',
          params: {
            'station': _i1.ParameterDescription(
              name: 'station',
              type: _i1.getType<_i16.Station>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['station'] as _i8.StationEndpoint).addStation(
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
              (endpoints['station'] as _i8.StationEndpoint).deleteStationById(
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
              (endpoints['station'] as _i8.StationEndpoint)
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
              type: _i1.getType<_i16.Station>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['station'] as _i8.StationEndpoint).updateStation(
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
              (endpoints['station'] as _i8.StationEndpoint)
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
              (endpoints['stop'] as _i9.StopEndpoint).getStopById(
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
              (endpoints['stop'] as _i9.StopEndpoint).getAllStops(session),
        ),
        'addStop': _i1.MethodConnector(
          name: 'addStop',
          params: {
            'stop': _i1.ParameterDescription(
              name: 'stop',
              type: _i1.getType<_i17.Stop>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stop'] as _i9.StopEndpoint).addStop(
            session,
            params['stop'],
          ),
        ),
        'updateStop': _i1.MethodConnector(
          name: 'updateStop',
          params: {
            'stop': _i1.ParameterDescription(
              name: 'stop',
              type: _i1.getType<_i17.Stop>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['stop'] as _i9.StopEndpoint).updateStop(
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
              (endpoints['stop'] as _i9.StopEndpoint).deleteStop(
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
              (endpoints['user'] as _i10.UserEndpoint).getUserById(
            session,
            id: params['id'],
          ),
        ),
        'addUser': _i1.MethodConnector(
          name: 'addUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i18.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).addUser(
            session,
            params['user'],
          ),
        ),
        'updateUser': _i1.MethodConnector(
          name: 'updateUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i18.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).updateUser(
            session,
            params['user'],
          ),
        ),
        'getUserName': _i1.MethodConnector(
          name: 'getUserName',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).getUserName(
            session,
            params['userInfoId'],
          ),
        ),
        'getUserEmail': _i1.MethodConnector(
          name: 'getUserEmail',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).getUserEmail(
            session,
            params['userInfoId'],
          ),
        ),
        'getUserByEmail': _i1.MethodConnector(
          name: 'getUserByEmail',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).getUserByEmail(
            session,
            params['email'],
          ),
        ),
        'getUserCreatedDate': _i1.MethodConnector(
          name: 'getUserCreatedDate',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).getUserCreatedDate(
            session,
            params['userInfoId'],
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
              (endpoints['user'] as _i10.UserEndpoint).deleteUser(
            session,
            params['id'],
          ),
        ),
        'getUserRole': _i1.MethodConnector(
          name: 'getUserRole',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).getUserRole(session),
        ),
        'getNonDriverUsers': _i1.MethodConnector(
          name: 'getNonDriverUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint)
                  .getNonDriverUsers(session),
        ),
        'updateUserRole': _i1.MethodConnector(
          name: 'updateUserRole',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newRole': _i1.ParameterDescription(
              name: 'newRole',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).updateUserRole(
            session,
            params['userId'],
            params['newRole'],
          ),
        ),
        'createUserWithDriverRole': _i1.MethodConnector(
          name: 'createUserWithDriverRole',
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
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i10.UserEndpoint).createUserWithDriverRole(
            session,
            email: params['email'],
            password: params['password'],
            name: params['name'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i19.Endpoints()..initializeEndpoints(server);
  }
}
