import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class BusEndpoint extends Endpoint {
  // Get bus by ID
  Future<Bus?> getBusById(Session session, int id) async {
    return await Bus.db.findById(session, id);
  }

  // Get all buses
  Future<List<Bus>> getAllBuses(Session session) async {
    return await Bus.db.find(session);
  }

  // Add a new bus
  Future<bool> addBus(Session session, Bus bus) async {
    await Bus.db.insert(session, [bus]);
    return true;
  }

  // Update an existing bus
  Future<bool> updateBus(Session session, Bus bus) async {
    if (bus.id == null) return false;

    var existingBus = await Bus.db.findById(session, bus.id!);
    if (existingBus != null) {
      await Bus.db.update(session, [bus]);
      return true;
    }
    return false;
  }

  // Delete a bus
  Future<bool> deleteBus(Session session, int id) async {
    var bus = await Bus.db.findById(session, id);
    if (bus != null) {
      await Bus.db.deleteWhere(session, where: (t) => t.id.equals(id));
      return true;
    }
    return false;
  }

  // Get buses with age between 0 and 3 years
  Future<List<Bus>> getBusesByAgeGroup1(Session session) async {
    // Get all buses from the database
    List<Bus> allBuses = await Bus.db.find(session);

    // Filter buses based on age range
    List<Bus> filteredBuses = allBuses.where((bus) => bus.age >= 0 && bus.age <= 3).toList();

    return filteredBuses;
  }

  // Get buses with age between 4 and 6 years
  Future<List<Bus>> getBusesByAgeGroup2(Session session) async {
    // Get all buses from the database
    List<Bus> allBuses = await Bus.db.find(session);

    // Filter buses based on age range
    List<Bus> filteredBuses = allBuses.where((bus) => bus.age >= 4 && bus.age <= 6).toList();

    return filteredBuses;
  }

  // Get buses with age 7 years and above
  Future<List<Bus>> getBusesByAgeGroup3(Session session) async {
    // Get all buses from the database
    List<Bus> allBuses = await Bus.db.find(session);

    // Filter buses based on age range
    List<Bus> filteredBuses = allBuses.where((bus) => bus.age >= 7).toList();

    return filteredBuses;
  }

  // Get buses with status "Operating"
  Future<List<Bus>> getBusesByStatusOperating(Session session) async {
    // Get all buses from the database
    List<Bus> allBuses = await Bus.db.find(session);

    // Filter buses based on status
    List<Bus> filteredBuses = allBuses.where((bus) => bus.status == "Operating").toList();

    return filteredBuses;
  }

  Future<List<Bus>> getAvailableOperatingBuses(Session session) async {
    // Get all buses with status 'Operating'
    List<Bus> operatingBuses = await Bus.db.find(
      session,
      where: (b) => b.status.equals('Operating'),
    );

    // Get all driver entries
    List<DriverInfo> allDrivers = await DriverInfo.db.find(session);

    // Get list of busIds that are already taken
    Set<int> takenBusIds = allDrivers
        .map((driver) => driver.busId)
        .toSet();

    // Filter out buses that are already assigned to drivers
    List<Bus> availableBuses = operatingBuses
        .where((bus) => !takenBusIds.contains(bus.id))
        .toList();

    return availableBuses;
  }


  // Get buses with status "In Maintenance"
  Future<List<Bus>> getBusesByStatusInMaintenance(Session session) async {
    // Get all buses from the database
    List<Bus> allBuses = await Bus.db.find(session);

    // Filter buses based on status
    List<Bus> filteredBuses = allBuses.where((bus) => bus.status == "In Maintenance").toList();

    return filteredBuses;
  }

  // Get buses with status "Out of Service"
  Future<List<Bus>> getBusesByStatusOutOfService(Session session) async {
    // Get all buses from the database
    List<Bus> allBuses = await Bus.db.find(session);

    // Filter buses based on status
    List<Bus> filteredBuses = allBuses.where((bus) => bus.status == "Out of Service").toList();

    return filteredBuses;
  }
  Future<List<Bus>> getUnassignedBuses(Session session) async {
    return await Bus.db.find(
      session,
      where: (b) => b.routeID.equals(null),
    );
  }

}
