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
            icon: const Icon(Icons.notification_add, size: 24),
            onPressed: () {
              print('Shopping Icon Pressed');
            },
          ),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(30.0), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), 
                  ),
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Circular border radius
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                ),
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
