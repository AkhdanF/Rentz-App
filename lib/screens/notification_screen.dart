import 'package:flutter/material.dart';
import 'package:myrentzapp/widgets/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  final List<NotificationModel> notifications;
  final Function(int) markAsRead;

  const NotificationScreen({
    Key? key,
    required this.notifications,
    required this.markAsRead,
  }) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: widget.notifications.length,
        itemBuilder: (context, index) {
          final notification = widget.notifications[index];
          return ListTile(
            title: Text(
              notification.title,
              style: TextStyle(
                fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Text(
              notification.description,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            onTap: () {
              widget.markAsRead(notification.id);
              // Optionally, navigate or perform other actions here
            },
          );
        },
      ),
    );
  }
}
