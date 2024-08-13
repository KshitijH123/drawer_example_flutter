import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row and Column Example'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Kshitij'),
              accountEmail: const Text('kshitijhapase@gmail.com'),
              currentAccountPicture: Image.asset('assets/images/profile.png'),
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text(
                'Home',
                style: TextStyle(
                  height: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.search_off_outlined),
              title: const Text(
                'Search',
                style: TextStyle(
                  height: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
           
             ListTile(
              leading: const Icon(Icons.settings), 
              title: const Text(
                'Settings',
                style: TextStyle(
                  height: 4,
                  fontWeight: FontWeight.bold, 
                
                ),
              ),
              onTap: () {},
            ),
            
          ],
        ),
      ),
      body: const Center(
        child: Text('Select a page from the menu.'),
      ),
    );
  }
}
