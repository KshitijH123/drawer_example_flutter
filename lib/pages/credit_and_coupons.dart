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
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}