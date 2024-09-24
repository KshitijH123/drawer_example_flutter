import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              leading: Icon(Icons.notifications, color: Colors.blue),
              title: Text(
                notifications[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notifications[index]['description']!),
                  SizedBox(height: 4),
                  Text(
                    notifications[index]['time']!,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
