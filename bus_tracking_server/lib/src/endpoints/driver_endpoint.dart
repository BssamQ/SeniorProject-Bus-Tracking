import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';
import '../generated/protocol.dart';

class DriverInfoEndpoint extends Endpoint {
  Future<DriverInfo> createDriver(Session session, DriverInfo driverInfo) async {
    return await DriverInfo.db.insertRow(session, driverInfo);
  }

  Future<DriverInfo?> getDriverById(Session session, int id) async {
    return await DriverInfo.db.findById(session, id);
  }

  Future<DriverInfo?> getDriverByUserInfoId(Session session, int userInfoId) async {
    return await DriverInfo.db.findFirstRow(
      session,
      where: (d) => d.userInfoId.equals(userInfoId),
    );
  }

  Future<List<DriverInfo>> getAllDrivers(Session session) async {
    return await DriverInfo.db.find(session);
  }

  Future<DriverInfo?> getDriverForBus(Session session, int busId) async {
    return await DriverInfo.db.findFirstRow(
      session,
      where: (d) => d.busId.equals(busId),
    );
  }

  Future<DriverInfo> updateDriver(Session session, DriverInfo driverInfo) async {
    return await DriverInfo.db.updateRow(session, driverInfo);
  }

  Future<bool> deleteDriver(Session session, int id) async {
    var driver = await DriverInfo.db.findById(session, id);
    if (driver == null) {
      return false;
    }
    await DriverInfo.db.deleteRow(session, driver);
    return true;
  }

  Future<bool> assignBusToDiver(Session session, int driverId, int busId) async {
    var driver = await DriverInfo.db.findById(session, driverId);
    if (driver == null) {
      return false;
    }

    driver.busId = busId;
    await DriverInfo.db.updateRow(session, driver);
    return true;
  }

  // Function to retrieve a driver's bus
  Future<Bus?> getDriverBus(Session session, int driverInfoId) async {
    // First find the driver
    var driverInfo = await DriverInfo.db.findById(session, driverInfoId);
    if (driverInfo == null) {
      return null;
    }

    // Then find the associated bus
    return await Bus.db.findById(session, driverInfo.busId);
  }

// Function to retrieve a driver's name
  Future<String?> getDriverName(Session session, int userInfoId) async {
    // First find the driver
    var driverInfo = await DriverInfo.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
    );
    if (driverInfo == null) {
      return null;
    }

    // Then find the associated UserInfo to get the name
    var userInfo = await UserInfo.db.findById(session, userInfoId);
    return userInfo?.userName;
  }

// Function to retrieve a driver's email
  Future<String?> getDriverEmail(Session session, int driverInfoId) async {
    // First find the driver
    var driverInfo = await DriverInfo.db.findById(session, driverInfoId);
    if (driverInfo == null) {
      return null;
    }

    // Then find the associated UserInfo to get the email
    var userInfo = await UserInfo.db.findById(session, driverInfo.userInfoId);
    return userInfo?.email;
  }

  Future<DriverInfo?> getDriverByBusId(Session session, int busId) async {
    final drivers = await DriverInfo.db.find(
      session,
      where: (d) => d.busId.equals(busId),
    );
    return drivers.isNotEmpty ? drivers.first : null;
  }


}