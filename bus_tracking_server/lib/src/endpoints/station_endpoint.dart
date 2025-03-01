import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class StationEndpoint extends Endpoint {
  // Fetch a station by its ID
  Future<Station?> getStationById(Session session, {required int id}) async {
    return await Station.db.findById(session, id);
  }

  // Add a new station
  Future<Station> addStation(Session session, Station station) async {
    return await Station.db.insertRow(session, station);
  }

  // Delete a station by its ID
  Future<bool> deleteStationById(Session session, {required int id}) async {
    var deletedStations = await Station.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return deletedStations.isNotEmpty;
  }


  // Search for stations by name
  Future<List<Station>> searchStationsByName(Session session, {required String name}) async {
    return await Station.db.find(
      session,
      where: (t) => t.name.ilike('%$name%'),
    );
  }

  // Update an existing station
  Future<Station?> updateStation(Session session, Station station) async {
    var existingStation = await Station.db.findById(session, station.id!);
    if (existingStation != null) {
      return await Station.db.updateRow(session, station);
    }
    return null;
  }

  // Fetch all stations
  Future<List<Station>> getAllStations(Session session) async {
    return await Station.db.find(session);
  }
}
