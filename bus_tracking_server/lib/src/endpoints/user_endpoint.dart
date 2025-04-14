import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

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
  Future<String?> getUserName(Session session, int userInfoId) async {
    // First, find the user in your User table
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
    );
    if (user == null) {
      return null;
    }

    // Then fetch the related UserInfo from serverpod_auth
    var userInfo = await UserInfo.db.findById(session, userInfoId);
    return userInfo?.userName;
  }
  Future<String?> getUserEmail(Session session, int userInfoId) async {
    // First, find the user in your User table
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
    );
    if (user == null) {
      return null;
    }



    // Then fetch the related UserInfo from serverpod_auth
    var userInfo = await UserInfo.db.findById(session, userInfoId);
    return userInfo?.email;
  }

  Future<UserInfo?> getUserByEmail(Session session, String email) async {
    return await UserInfo.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );
  }

  Future<DateTime?> getUserCreatedDate(Session session, int userInfoId) async {
    // First, find the user in your User table
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
    );
    if (user == null) {
      return null;
    }

    // Then fetch the related UserInfo from serverpod_auth
    var userInfo = await UserInfo.db.findById(session, userInfoId);
    return userInfo?.created;
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

  Future<List<User>> getNonDriverUsers(Session session) async {
    return await User.db.find(
      session,
      where: (u) => u.role.notEquals('Driver'),
    );
  }
  Future<bool> updateUserRole(Session session, int userId, String newRole) async {
    var user = await User.db.findById(session, userId);
    if (user != null) {
      user.role = newRole;
      await User.db.update(session, [user]);
      return true;
    }
    return false;
  }


  Future<int?> createUserWithDriverRole(
      Session session, {
        required String email,
        required String password,
        required String name,
      }) async {
    final userInfo = await auth.Emails.createUser(session, name, email, password);

    if (userInfo == null || userInfo.id == null) {
      return null;
    }

    final user = User(
      userInfoId: userInfo.id!,
      role: "Driver",
    );

    await User.db.insertRow(session, user);

    return userInfo.id; // Return this to the client
  }


}



