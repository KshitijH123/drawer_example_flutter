import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, String>> notifications = [
    {
      'title': 'Order Shipped',
      'description': 'Your order #1234 has been shipped!',
      'time': '2 hours ago',
    },
    {
      'title': 'New Message',
      'description': 'You have a new message from support.',
      'time': '5 hours ago',
    },
    {
      'title': 'Discount Offer',
      'description': 'Get 20% off on your next purchase!',
      'time': '1 day ago',
    },
    {
      'title': 'Feedback Request',
      'description': 'Please provide feedback on your recent order.',
      'time': '2 days ago',
    },
  ];

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _deleteNotification(index), 
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                leading: const Icon(Icons.notifications, color: Colors.blue),
                title: Text(
                  notifications[index]['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notifications[index]['description']!),
                   const SizedBox(height: 4),
                    Text(
                      notifications[index]['time']!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.blue[200]),
                  onPressed: () => _deleteNotification(index),
                  tooltip: 'Delete Notification',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
