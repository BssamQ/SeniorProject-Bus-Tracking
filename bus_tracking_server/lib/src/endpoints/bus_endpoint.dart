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
}
