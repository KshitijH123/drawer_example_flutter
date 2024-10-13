import 'package:flutter/material.dart';

class CreditAndCoupons extends StatefulWidget {
  const CreditAndCoupons({super.key});

  @override
  State<CreditAndCoupons> createState() => _CreditAndCouponsState();
}

class _CreditAndCouponsState extends State<CreditAndCoupons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<bool> couponApplied = [false, false, false];

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
              style: Theme.of(context).textTheme.headlineLarge,
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '100 Points',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
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
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: couponApplied.length,
                itemBuilder: (context, index) {
                  return _buildCouponCard(
                    index,
                    index == 0
                        ? '10% Off on your next purchase'
                        : index == 1
                            ? 'Free Shipping on orders over \$50'
                            : 'Buy 1 Get 1 Free',
                    index == 0
                        ? 'Valid till: 31 Dec 2023'
                        : index == 1
                            ? 'Valid till: 30 Nov 2023'
                            : 'Valid till: 15 Oct 2023',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponCard(int index, String title, String validity) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(validity),
            if (couponApplied[index])
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Coupon Applied!',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              couponApplied[index] = true; 
            });
          },
          child: Text(couponApplied[index] ? 'Applied' : 'Apply'),
        ),
      ),
    );
  }
}
