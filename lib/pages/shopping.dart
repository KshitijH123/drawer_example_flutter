import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  final List<String> items = [
    'Switches',
    'Door Lock',
    'Car Door',
    'Mobile Stand',
    'Radio Switch',
    'Electric Switches',
    'Buttons',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            trailing: const Icon(Icons.add_shopping_cart),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${items[index]} added to cart!')),
              );
            },
          );
        },
      ),
    );
  }
}
