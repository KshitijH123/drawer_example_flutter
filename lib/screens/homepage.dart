import 'package:drawer_example_flutter/screens/home_screen.dart';
import 'package:drawer_example_flutter/screens/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget menuItem({
    required IconData icon,
    required String name,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30.0),
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, height: 1.5),
        ),
      ),
      onTap: onTap,
    );
  }

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
              currentAccountPicture:
                  Image.asset('assets/images/new_profile.png'),
            ),
            menuItem(
                icon: Icons.home,
                name: 'Home',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }),
            menuItem(icon: Icons.search, name: 'Search'),
            menuItem(icon: Icons.call, name: 'Contact Us'),
            menuItem(icon: Icons.question_mark, name: 'Help & Feedback'),
            menuItem(icon: Icons.settings, name: 'Settings'),
            menuItem(
              icon: Icons.logout,
              name: 'Log-Out',
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
