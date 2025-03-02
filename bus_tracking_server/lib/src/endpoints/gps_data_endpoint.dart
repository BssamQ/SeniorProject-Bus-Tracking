import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class GPSDataEndpoint extends Endpoint {
  // Get GPS data by Bus ID
  Future<List<GPSData>> getGPSDataByBusId(Session session, int busId) async {
    return await GPSData.db.find(session, where: (t) => t.busID.equals(busId));
  }

  // Add new GPS data entry
  Future<bool> addGPSData(Session session, GPSData gpsData) async {
    await GPSData.db.insert(session, [gpsData]);
    return true;
  }

  // Delete GPS data
  Future<bool> deleteGPSData(Session session, int id) async {
    var data = await GPSData.db.findById(session, id);
    if (data != null) {
      await GPSData.db.deleteWhere(session, where: (t) => t.id.equals(id));
      return true;
    }
    return false;
  }
}
