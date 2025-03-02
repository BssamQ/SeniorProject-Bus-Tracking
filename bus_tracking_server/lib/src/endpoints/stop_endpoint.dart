import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class StopEndpoint extends Endpoint {
  // Get stop by ID
  Future<Stop?> getStopById(Session session, int id) async {
    return await Stop.db.findById(session, id);
  }

  // Get all stops
  Future<List<Stop>> getAllStops(Session session) async {
    return await Stop.db.find(session);
  }

  // Add a new stop
  Future<bool> addStop(Session session, Stop stop) async {
    await Stop.db.insert(session, [stop]);
    return true;
  }

  // Update an existing stop
  Future<bool> updateStop(Session session, Stop stop) async {
    if (stop.id == null) return false;

    var existingStop = await Stop.db.findById(session, stop.id!);
    if (existingStop != null) {
      await Stop.db.update(session, [stop]);
      return true;
    }
    return false;
  }

  // Delete a stop
  Future<bool> deleteStop(Session session, int id) async {
    var stop = await Stop.db.findById(session, id);
    if (stop != null) {
      await Stop.db.deleteWhere(session, where: (t) => t.id.equals(id));
      return true;
    }
    return false;
  }
}
