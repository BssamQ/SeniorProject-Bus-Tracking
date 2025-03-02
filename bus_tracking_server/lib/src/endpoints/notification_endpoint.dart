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
