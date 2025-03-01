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
import 'package:bus_tracking_client/src/protocol/stations.dart' as _i3;
import 'package:bus_tracking_client/src/protocol/user_class.dart' as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

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
class EndpointStation extends _i1.EndpointRef {
  EndpointStation(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'station';

  _i2.Future<_i3.Station?> getStationById({required int id}) =>
      caller.callServerEndpoint<_i3.Station?>(
        'station',
        'getStationById',
        {'id': id},
      );

  _i2.Future<_i3.Station> addStation(_i3.Station station) =>
      caller.callServerEndpoint<_i3.Station>(
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

  _i2.Future<List<_i3.Station>> searchStationsByName({required String name}) =>
      caller.callServerEndpoint<List<_i3.Station>>(
        'station',
        'searchStationsByName',
        {'name': name},
      );

  _i2.Future<_i3.Station?> updateStation(_i3.Station station) =>
      caller.callServerEndpoint<_i3.Station?>(
        'station',
        'updateStation',
        {'station': station},
      );

  _i2.Future<List<_i3.Station>> getAllStations() =>
      caller.callServerEndpoint<List<_i3.Station>>(
        'station',
        'getAllStations',
        {},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i4.User?> getUserById({int? id}) =>
      caller.callServerEndpoint<_i4.User?>(
        'user',
        'getUserById',
        {'id': id},
      );

  _i2.Future<bool> addUser(_i4.User user) => caller.callServerEndpoint<bool>(
        'user',
        'addUser',
        {'user': user},
      );

  _i2.Future<bool> updateUser(_i4.User user) => caller.callServerEndpoint<bool>(
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
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
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
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    example = EndpointExample(this);
    station = EndpointStation(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointExample example;

  late final EndpointStation station;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'station': station,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
