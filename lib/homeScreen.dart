import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, size: 24),
            onPressed: () {
              print('Heart Icon Pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 24),
            onPressed: () {
              print('Shopping Icon Pressed');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          // Main content area
          Expanded(
            child: Center(
              child: Text('Content Goes Here'),
            ),
          ),
        ],
      ),
    );
  }
}
