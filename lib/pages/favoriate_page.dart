import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body:const Center(child: Text('Favorites Page',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)),
    );
  }
}
