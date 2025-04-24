import 'package:flutter/material.dart';
import 'package:bus_tracking_client/bus_tracking_client.dart' as proto;
import '../main.dart';

class AdminNotificationsScreen extends StatefulWidget {
  const AdminNotificationsScreen({super.key});

  @override
  State<AdminNotificationsScreen> createState() => _AdminNotificationsScreenState();
}

class _AdminNotificationsScreenState extends State<AdminNotificationsScreen>
    with SingleTickerProviderStateMixin {
  List<proto.Notification> _ongoing = [];
  List<proto.Notification> _completed = [];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadNotifications();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadNotifications() async {
    final all = await client.notification.getAllNotifications();

    setState(() {
      final notifications = all.cast<proto.Notification>();
      _ongoing = notifications
          .where((n) => n.readStatus == 'Unread' && n.type == 'Emergency')
          .toList();
      _completed = notifications
          .where((n) => n.readStatus == 'Read' && n.type == 'Emergency')
          .toList();
    });
  }

  Future<void> _markAsRead(proto.Notification notif) async {
    await client.notification.markNotificationAsRead(notif.id!);
    setState(() {
      _ongoing.remove(notif);
      notif.readStatus = 'Read';
      _completed.add(notif);
    });
  }

  void _removeFromView(proto.Notification notif) {
    setState(() {
      _completed.remove(notif);
    });
  }

  Future<void> _showNotificationDetails(proto.Notification notif) async {
    final driver = await client.driverInfo.getDriverById(notif.userID);
    final driverName = await client.driverInfo.getDriverName(driver?.userInfoId ?? 0);
    final driverEmail = await client.driverInfo.getDriverEmail(driver?.id ?? 0);

    if (context.mounted) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Emergency Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date: ${notif.timestamp}'),
              const SizedBox(height: 6),
              Text('Message: ${notif.message}'),
              const Divider(),
              Text('Driver ID: ${driver?.id ?? "Unknown"}'),
              Text('Driver Name: ${driverName ?? "Unknown"}'),
              Text('Driver Email: ${driverEmail ?? "Unknown"}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? Colors.grey[900] : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Notifications'),
        backgroundColor: isDark ? Colors.black : Colors.white,
        foregroundColor: textColor,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          unselectedLabelColor: textColor,
          indicatorColor: Colors.green,
          tabs: const [
            Tab(text: 'Ongoing'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      backgroundColor: bgColor,
      body: RefreshIndicator(
        onRefresh: _loadNotifications,
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildOngoingList(isDark, textColor),
            _buildCompletedList(isDark, textColor),
          ],
        ),
      ),
    );
  }

  Widget _buildOngoingList(bool isDark, Color textColor) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _ongoing.length,
      itemBuilder: (context, index) {
        final notif = _ongoing[index];
        return Card(
          color: isDark ? Colors.grey[850] : Colors.grey[200],
          child: ListTile(
            leading: const Icon(Icons.warning, color: Colors.orange),
            title: Text('From Driver ID: ${notif.userID}', style: TextStyle(color: textColor)),
            subtitle: Text(
              notif.message,
              style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: () => _markAsRead(notif),
              tooltip: 'Mark as completed',
            ),
            onTap: () => _showNotificationDetails(notif),
          ),
        );
      },
    );
  }

  Widget _buildCompletedList(bool isDark, Color textColor) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _completed.length,
      itemBuilder: (context, index) {
        final notif = _completed[index];
        return Dismissible(
          key: ValueKey(notif.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => _removeFromView(notif),
          background: Container(
            color: Colors.redAccent,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: Card(
            color: isDark ? Colors.grey[850] : Colors.grey[200],
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: Text('From Driver ID: ${notif.userID}', style: TextStyle(color: textColor)),
              subtitle: Text(
                notif.message,
                style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
              ),
              onTap: () => _showNotificationDetails(notif),
            ),
          ),
        );
      },
    );
  }
}
