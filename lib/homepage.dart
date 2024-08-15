import 'package:drawer_example_flutter/loginpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Example'),
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
              leading: const Icon(
                Icons.home,
                size: 30.0,
              ),
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    height: 1.5,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.search, size: 30.0),
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  'Search',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    height: 1.5,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.call, size: 30.0),
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    height: 1.5,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.question_mark, size: 30.0),
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  'Help & Feedback',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    height: 1.5,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, size: 30.0),
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    height: 1.5,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, size: 30.0),
              title: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  'Log-Out',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    height: 1.5,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
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
