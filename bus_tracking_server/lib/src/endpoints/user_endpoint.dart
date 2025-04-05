import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class UserEndpoint extends Endpoint {
  // Search the user by name


  // Search the user by ID
  Future<User?> getUserById(Session session, {int? id}) async {
    return await User.db.findById(session, id ?? 1);
  }

  @override
  bool get requireLogin => false;
  // Add a new user
  Future<bool> addUser(Session session, User user) async {
    await User.db.insert(session, [user]);
    return true;
  }

  // Change an existing user
  Future<bool> updateUser(Session session, User user) async {
    if (user.id == null) {
      return false; // Return false if the user ID is null
    }

    var existingUser = await User.db.findById(session, user.id!); // Force unwrap the id
    if (existingUser != null) {
      await User.db.update(session, [user]); // Update the user if they exist
      return true; // Return true if the user was updated
    }
    return false;
  }

  // Delete a user
  Future<bool> deleteUser(Session session, int id) async {
    var user = await User.db.findById(session, id);
    if (user != null) {
      await User.db.deleteWhere(session, where: (t) => t.id.equals(id));
      return true;
    }
    return false;
  }

  Future<String?> getUserRole(Session session) async {
    // Get the authenticated user's ID from the session
    final authenticationInfo = await session.authenticated;
    final userId = authenticationInfo?.userId;

    if (userId == null) {
      // User is not authenticated
      return null;
    }

    // Find the User record that corresponds to the authenticated UserInfo
    var user = await User.db.findFirstRow(
        session,
        where: (u) => u.userInfoId.equals(userId)
    );

    // Return the role if the user was found
    return user?.role;
  }


}



