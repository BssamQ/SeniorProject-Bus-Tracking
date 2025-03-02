import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class RouteEndpoint extends Endpoint {
  // Get route by ID
  Future<Route?> getRouteById(Session session, int id) async {
    return await Route.db.findById(session, id);
  }

  // Get all routes
  Future<List<Route>> getAllRoutes(Session session) async {
    return await Route.db.find(session);
  }

  // Add a new route
  Future<bool> addRoute(Session session, Route route) async {
    await Route.db.insert(session, [route]);
    return true;
  }

  // Update an existing route
  Future<bool> updateRoute(Session session, Route route) async {
    if (route.id == null) return false;

    var existingRoute = await Route.db.findById(session, route.id!);
    if (existingRoute != null) {
      await Route.db.update(session, [route]);
      return true;
    }
    return false;
  }

  // Delete a route
  Future<bool> deleteRoute(Session session, int id) async {
    var route = await Route.db.findById(session, id);
    if (route != null) {
      await Route.db.deleteWhere(session, where: (t) => t.id.equals(id));
      return true;
    }
    return false;
  }
}
