import 'package:bus_tracking_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class NotificationEndpoint extends Endpoint {
  // Get notifications by User ID
  Future<List<Notification>> getNotificationsByUserId(Session session, int userId) async {
    return await Notification.db.find(session, where: (t) => t.userID.equals(userId));
  }

  // Add a new notification
  Future<bool> addNotification(Session session, Notification notification) async {
    await Notification.db.insert(session, [notification]);
    return true;
  }

  // Mark notification as read
  Future<bool> markNotificationAsRead(Session session, int notificationId) async {
    var notification = await Notification.db.findById(session, notificationId);
    if (notification != null) {
      notification.readStatus = "Read";
      await Notification.db.update(session, [notification]);
      return true;
    }
    return false;
  }
  Future<void> createEmergencyNotification(Session session, int driverId, String message) async {
    var notification = Notification(
      userID: driverId,
      type: 'Emergency',
      message: message,
      readStatus: "Unread", // use consistent casing with your schema
      timestamp: DateTime.now(), // add current timestamp
    );

    await Notification.db.insertRow(session, notification);
  }
  Future<List<Notification>> getNotificationsForDriver(Session session) async {
    final authUser = await session.authenticated;
    if (authUser == null) {
      throw Exception("User not authenticated.");
    }

    // Find the DriverInfo for this user
    final driverInfo = await DriverInfo.db.findFirstRow(
      session,
      where: (d) => d.userInfoId.equals(authUser.userId),
    );

    if (driverInfo == null) {
      throw Exception("Driver not found for this user.");
    }

    // Fetch notifications using userID (which equals driverInfo.id in this case)
    return await Notification.db.find(
      session,
      where: (t) => t.userID.equals(driverInfo.id),
    );
  }
  Future<void> markNotificationRead(Session session, int notificationId) async {
    var notification = await Notification.db.findById(session, notificationId);
    if (notification != null) {
      notification.readStatus = "true";
      await Notification.db.updateRow(session, notification);
    }
  }
  Future<List<Notification>> getAllNotifications(Session session) async {
    return await Notification.db.find(
      session,
      orderBy: (t) => t.timestamp, // Optional: newest first
    );
  }





  // Delete a notification
  Future<bool> deleteNotification(Session session, int notificationId) async {
    var notification = await Notification.db.findById(session, notificationId);
    if (notification != null) {
      await Notification.db.deleteWhere(session, where: (t) => t.id.equals(notificationId));
      return true;
    }
    return false;
  }
}
