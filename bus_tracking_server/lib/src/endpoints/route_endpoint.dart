import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class RouteEndpoint extends Endpoint {
  // Get route by ID
  Future<Routes?> getRouteById(Session session, int id) async {
    return await Routes.db.findById(session, id);
  }

  // Get all routes
  Future<List<Routes>> getAllRoutes(Session session) async {
    return await Routes.db.find(session);
  }

  // Add a new route
  Future<bool> addRoute(Session session, Routes route) async {
    await Routes.db.insert(session, [route]);
    return true;
  }

  // Update an existing route
  Future<bool> updateRoute(Session session, Routes route) async {
    if (route.id == null) return false;

    var existingRoute = await Routes.db.findById(session, route.id!);
    if (existingRoute != null) {
      await Routes.db.update(session, [route]);
      return true;
    }
    return false;
  }

  // Delete a route
  Future<bool> deleteRoute(Session session, int id) async {
    var route = await Routes.db.findById(session, id);
    if (route != null) {
      await Routes.db.deleteWhere(session, where: (t) => t.id.equals(id));
      return true;
    }
    return false;
  }

  // Get route name by ID
  Future<String?> getRouteNameById(Session session, int id) async {
    var route = await Routes.db.findById(session, id);
    return route?.routeName; // Return the route name if the route exists
  }

  // Get all route names
  Future<List<String>> getAllRouteNames(Session session) async {
    var routes = await Routes.db.find(session);
    return routes.map((route) => route.routeName).toList(); // Return a list of all route names
  }

  // Endpoint to get routes by location
  Future<List<Routes>> getRoutesByLocation(Session session, double startLatitude, double startLongitude, double endLatitude, double endLongitude) async {
    return await Routes.db.find(
      session,
      where: (t) =>
      t.startlatitude.equals(startLatitude) &
      t.startlongitude.equals(startLongitude) &
      t.endlatitude.equals(endLatitude) &
      t.endlongitude.equals(endLongitude),
    );
  }

  // Endpoint to update the route's start time (nullable)
  Future<bool> updateRouteStartTime(Session session, int routeId, String? newStartTime) async {
    var route = await Routes.db.findById(session, routeId);
    if (route != null) {
      route.routeStartTime = newStartTime;
      await Routes.db.update(session, [route]);
      return true;
    }
    return false;
  }
}
