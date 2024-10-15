import 'package:drawer_example_flutter/pages/contact_us.dart';
import 'package:drawer_example_flutter/pages/homeScreen.dart';
import 'package:drawer_example_flutter/pages/loginpage.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Example',style: TextStyle(fontWeight:FontWeight.w600,fontSize: 22 ),),
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
              leading: const Icon(Icons.home, size: 30.0),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUs()),
                );
                 },
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
           body: Center(
        child: SizedBox(
          width: 350, 
          height: 250, 
          child: Image.asset(
            'assets/images/jay.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
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
            child: const Text('Log Out'),
          ),
        ],
      );
    },
  );
}
