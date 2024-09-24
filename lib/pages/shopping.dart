import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping')),
      body: const Center(child: Text('Shopping Page',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      )),
    );
  }
}
