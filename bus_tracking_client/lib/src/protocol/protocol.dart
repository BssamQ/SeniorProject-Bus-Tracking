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
import 'bus_class.dart' as _i2;
import 'example.dart' as _i3;
import 'gps_data_class.dart' as _i4;
import 'notifications_class.dart' as _i5;
import 'route_class.dart' as _i6;
import 'stations.dart' as _i7;
import 'stop_class.dart' as _i8;
import 'user_class.dart' as _i9;
import 'package:bus_tracking_client/src/protocol/bus_class.dart' as _i10;
import 'package:bus_tracking_client/src/protocol/gps_data_class.dart' as _i11;
import 'package:bus_tracking_client/src/protocol/notifications_class.dart'
    as _i12;
import 'package:bus_tracking_client/src/protocol/route_class.dart' as _i13;
import 'package:bus_tracking_client/src/protocol/stations.dart' as _i14;
import 'package:bus_tracking_client/src/protocol/stop_class.dart' as _i15;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i16;
export 'bus_class.dart';
export 'example.dart';
export 'gps_data_class.dart';
export 'notifications_class.dart';
export 'route_class.dart';
export 'stations.dart';
export 'stop_class.dart';
export 'user_class.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Bus) {
      return _i2.Bus.fromJson(data) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.GPSData) {
      return _i4.GPSData.fromJson(data) as T;
    }
    if (t == _i5.Notification) {
      return _i5.Notification.fromJson(data) as T;
    }
    if (t == _i6.Route) {
      return _i6.Route.fromJson(data) as T;
    }
    if (t == _i7.Station) {
      return _i7.Station.fromJson(data) as T;
    }
    if (t == _i8.Stop) {
      return _i8.Stop.fromJson(data) as T;
    }
    if (t == _i9.User) {
      return _i9.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Bus?>()) {
      return (data != null ? _i2.Bus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.GPSData?>()) {
      return (data != null ? _i4.GPSData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Notification?>()) {
      return (data != null ? _i5.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Route?>()) {
      return (data != null ? _i6.Route.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Station?>()) {
      return (data != null ? _i7.Station.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Stop?>()) {
      return (data != null ? _i8.Stop.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.User?>()) {
      return (data != null ? _i9.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i4.GPSData>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i4.GPSData>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i8.Stop>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.Stop>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i2.Bus>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i2.Bus>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i5.Notification>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.Notification>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i10.Bus>) {
      return (data as List).map((e) => deserialize<_i10.Bus>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.GPSData>) {
      return (data as List).map((e) => deserialize<_i11.GPSData>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.Notification>) {
      return (data as List)
          .map((e) => deserialize<_i12.Notification>(e))
          .toList() as dynamic;
    }
    if (t == List<_i13.Route>) {
      return (data as List).map((e) => deserialize<_i13.Route>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.Station>) {
      return (data as List).map((e) => deserialize<_i14.Station>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.Stop>) {
      return (data as List).map((e) => deserialize<_i15.Stop>(e)).toList()
          as dynamic;
    }
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Bus) {
      return 'Bus';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.GPSData) {
      return 'GPSData';
    }
    if (data is _i5.Notification) {
      return 'Notification';
    }
    if (data is _i6.Route) {
      return 'Route';
    }
    if (data is _i7.Station) {
      return 'Station';
    }
    if (data is _i8.Stop) {
      return 'Stop';
    }
    if (data is _i9.User) {
      return 'User';
    }
    className = _i16.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Bus') {
      return deserialize<_i2.Bus>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (dataClassName == 'GPSData') {
      return deserialize<_i4.GPSData>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i5.Notification>(data['data']);
    }
    if (dataClassName == 'Route') {
      return deserialize<_i6.Route>(data['data']);
    }
    if (dataClassName == 'Station') {
      return deserialize<_i7.Station>(data['data']);
    }
    if (dataClassName == 'Stop') {
      return deserialize<_i8.Stop>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i9.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
