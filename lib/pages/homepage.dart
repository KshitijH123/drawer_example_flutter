import 'package:drawer_example_flutter/pages/homeScreen.dart';
import 'package:drawer_example_flutter/pages/loginpage.dart';
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
              currentAccountPicture: Image.asset('assets/images/new_profile.png'),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
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
                             _showLogoutConfirmationDialog(context);

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
 void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false, 
                );
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
