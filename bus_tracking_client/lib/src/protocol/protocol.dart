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
import 'driver_class.dart' as _i3;
import 'example.dart' as _i4;
import 'gps_data_class.dart' as _i5;
import 'notifications_class.dart' as _i6;
import 'route_class.dart' as _i7;
import 'stations.dart' as _i8;
import 'stop_class.dart' as _i9;
import 'user_class.dart' as _i10;
import 'package:bus_tracking_client/src/protocol/bus_class.dart' as _i11;
import 'package:bus_tracking_client/src/protocol/driver_class.dart' as _i12;
import 'package:bus_tracking_client/src/protocol/gps_data_class.dart' as _i13;
import 'package:bus_tracking_client/src/protocol/notifications_class.dart'
    as _i14;
import 'package:bus_tracking_client/src/protocol/route_class.dart' as _i15;
import 'package:bus_tracking_client/src/protocol/stations.dart' as _i16;
import 'package:bus_tracking_client/src/protocol/stop_class.dart' as _i17;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i18;
export 'bus_class.dart';
export 'driver_class.dart';
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
    if (t == _i3.DriverInfo) {
      return _i3.DriverInfo.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i5.GPSData) {
      return _i5.GPSData.fromJson(data) as T;
    }
    if (t == _i6.Notification) {
      return _i6.Notification.fromJson(data) as T;
    }
    if (t == _i7.Routes) {
      return _i7.Routes.fromJson(data) as T;
    }
    if (t == _i8.Station) {
      return _i8.Station.fromJson(data) as T;
    }
    if (t == _i9.Stop) {
      return _i9.Stop.fromJson(data) as T;
    }
    if (t == _i10.User) {
      return _i10.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Bus?>()) {
      return (data != null ? _i2.Bus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DriverInfo?>()) {
      return (data != null ? _i3.DriverInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.GPSData?>()) {
      return (data != null ? _i5.GPSData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Notification?>()) {
      return (data != null ? _i6.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Routes?>()) {
      return (data != null ? _i7.Routes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Station?>()) {
      return (data != null ? _i8.Station.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Stop?>()) {
      return (data != null ? _i9.Stop.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.User?>()) {
      return (data != null ? _i10.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i5.GPSData>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.GPSData>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i9.Stop>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i9.Stop>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i2.Bus>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i2.Bus>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i6.Notification>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.Notification>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i11.Bus>) {
      return (data as List).map((e) => deserialize<_i11.Bus>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.DriverInfo>) {
      return (data as List).map((e) => deserialize<_i12.DriverInfo>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.GPSData>) {
      return (data as List).map((e) => deserialize<_i13.GPSData>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.Notification>) {
      return (data as List)
          .map((e) => deserialize<_i14.Notification>(e))
          .toList() as dynamic;
    }
    if (t == List<_i15.Routes>) {
      return (data as List).map((e) => deserialize<_i15.Routes>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i16.Station>) {
      return (data as List).map((e) => deserialize<_i16.Station>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.Stop>) {
      return (data as List).map((e) => deserialize<_i17.Stop>(e)).toList()
          as dynamic;
    }
    try {
      return _i18.Protocol().deserialize<T>(data, t);
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
    if (data is _i3.DriverInfo) {
      return 'DriverInfo';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.GPSData) {
      return 'GPSData';
    }
    if (data is _i6.Notification) {
      return 'Notification';
    }
    if (data is _i7.Routes) {
      return 'Routes';
    }
    if (data is _i8.Station) {
      return 'Station';
    }
    if (data is _i9.Stop) {
      return 'Stop';
    }
    if (data is _i10.User) {
      return 'User';
    }
    className = _i18.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'DriverInfo') {
      return deserialize<_i3.DriverInfo>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (dataClassName == 'GPSData') {
      return deserialize<_i5.GPSData>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i6.Notification>(data['data']);
    }
    if (dataClassName == 'Routes') {
      return deserialize<_i7.Routes>(data['data']);
    }
    if (dataClassName == 'Station') {
      return deserialize<_i8.Station>(data['data']);
    }
    if (dataClassName == 'Stop') {
      return deserialize<_i9.Stop>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i10.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i18.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
