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
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            margin:
                const EdgeInsets.only(bottom: 24.0),
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${items[index]} added to cart!')),
                );
              },
              child: ListTile(
                title: Text(
                  items[index],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.shopping_cart,color: Colors.blueAccent,size: 36,),
              ),
            ),
          );
        },
      ),
    );
  }
}
