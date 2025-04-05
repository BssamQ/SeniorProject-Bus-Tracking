import 'package:serverpod/server.dart';
import 'package:bus_tracking_server/src/generated/protocol.dart';


class SimulationEndpoint extends Endpoint {
  // In-memory storage for simulation data (in a real app, use a database)
  final _simulations = <String, SimulationData>{};

  // Endpoint 1: Start Simulation
  @override
  Future<void> startSimulation(
    Session session, {
    required String routeId,
    required double latitude,
    required double longitude,
  }) async {
    // Validate inputs
    if (routeId.isEmpty) {
      throw ArgumentError('Route ID cannot be empty');
    }

    // Create new simulation data
    final simulationData = SimulationData(
      routeId: routeId,
      positions: [
        BusPosition(
          latitude: latitude,
          longitude: longitude,
          timestamp: DateTime.now().toUtc(),
        ),
      ],
      startTime: DateTime.now().toUtc(),
      isActive: true,
    );

    // Store the simulation
    _simulations[routeId] = simulationData;

    session.log('Simulation started for route $routeId');
  }

  // Endpoint 2: Update Position
  @override
  Future<void> updatePosition(
    Session session, {
    required String routeId,
    required double latitude,
    required double longitude,
  }) async {
    // Check if simulation exists
    if (!_simulations.containsKey(routeId)) {
      throw ArgumentError('No active simulation for this route');
    }

    // Get current simulation data
    final simulation = _simulations[routeId]!;

    // Add new position
    simulation.positions.add(
      BusPosition(
        latitude: latitude,
        longitude: longitude,
        timestamp: DateTime.now().toUtc(),
      ),
    );

    session.log('Position updated for route $routeId');
  }

  // Endpoint 3: End Simulation
  @override
  Future<SimulationData> endSimulation(
    Session session, {
    required String routeId,
    required double latitude,
    required double longitude,
  }) async {
    // Check if simulation exists
    if (!_simulations.containsKey(routeId)) {
      throw ArgumentError('No active simulation for this route');
    }

    // Get current simulation data
    final simulation = _simulations[routeId]!;

    // Add final position
    simulation.positions.add(
      BusPosition(
        latitude: latitude,
        longitude: longitude,
        timestamp: DateTime.now().toUtc(),
      ),
    );

    // Mark as completed
    simulation.endTime = DateTime.now().toUtc();
    simulation.isActive = false;

    session.log('Simulation ended for route $routeId');

    // Return the complete simulation data
    return simulation;
  }

  // Additional helper method to get current position
  @override
  Future<BusPosition?> getCurrentPosition(
    Session session, {
    required String routeId,
  }) async {
    if (!_simulations.containsKey(routeId) || !_simulations[routeId]!.isActive) {
      return null;
    }

    final positions = _simulations[routeId]!.positions;
    return positions.isNotEmpty ? positions.last : null;
  }
}