import 'package:flutter/material.dart';

class CreditAndCoupons extends StatefulWidget {
  const CreditAndCoupons({super.key});

  @override
  State<CreditAndCoupons> createState() => _CreditAndCouponsState();
}

class _CreditAndCouponsState extends State<CreditAndCoupons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit & Coupons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Point Credits',
              style:
                  Theme.of(context).textTheme.headlineLarge, 
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'You have:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium, // Updated to bodyText1
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '100 Points',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge, // Updated to headline4
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle redeeming points
                      },
                      child: const Text('Redeem Points'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Available Coupons',
              style:
                  Theme.of(context).textTheme.headlineLarge, // Updated to headline5
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildCouponCard('10% Off on your next purchase',
                      'Valid till: 31 Dec 2023'),
                  _buildCouponCard('Free Shipping on orders over \$50',
                      'Valid till: 30 Nov 2023'),
                  _buildCouponCard(
                      'Buy 1 Get 1 Free', 'Valid till: 15 Oct 2023'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponCard(String title, String validity) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(validity),
        trailing: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Apply'),
        ),
      ),
    );
  }
}
