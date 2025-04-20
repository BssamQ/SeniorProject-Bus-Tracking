import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class EmergencyEndpoint extends Endpoint {
  // Create a new emergency alert
  Future<void> reportEmergency(Session session, Emergency emergency) async {
    emergency.timestamp = DateTime.now();
    emergency.isResolved = false;
    await Emergency.db.insertRow(session, emergency);
  }

  // Optional: Get emergencies for admin/future use
  Future<List<Emergency>> getEmergencies(Session session) async {
    return await Emergency.db.find(session);
  }
}
