import 'package:flutter/material.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in Touch',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'We are here to help you with your shopping experience. Feel free to reach out to us through any of the following methods:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            _buildContactDetail(
              context,
              title: 'Email',
              content: 'jayelectricproduct@gmail.com',
              icon: Icons.email,
            ),
            const SizedBox(height: 16),
            _buildContactDetail(
              context,
              title: 'Phone',
              content: '64369633',
              icon: Icons.phone,
            ),
            const SizedBox(height: 16),
            _buildContactDetail(
              context,
              title: 'Address',
              content: '123 Shopping St, Suite 456\nCity, State, 12345',
              icon: Icons.location_on,
            ),
            const SizedBox(height: 20),
            Text(
              'Business Hours',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Monday - Friday: 9 AM - 5 PM\nSaturday: 10 AM - 4 PM\nSunday: Closed',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactDetail(BuildContext context, {required String title, required String content, required IconData icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24, color: Theme.of(context).primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
