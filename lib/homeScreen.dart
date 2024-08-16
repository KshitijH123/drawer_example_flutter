import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Row get bottomNavigationBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('asset/images/icon_home.png', height: 26, width: 26),
        const SizedBox(width: 80),
        Image.asset('asset/images/icon_clock.png', height: 26, width: 26),
        const SizedBox(width: 80),
        Image.asset('asset/images/icon_heart_(1).png', height: 26, width: 26),
        const SizedBox(width: 80),
        Image.asset('asset/images/icon_user_(1).png', height: 26, width: 26),
      ],
    );
  }

  Widget get buttons {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SizedBox(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  print('Button Pressed');
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Most Viewed',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    print('Button Pressed');
                  },
                  child: const Text('Near By',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    print('Button Pressed');
                  },
                  child: const Text('Latest',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400))),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(26),
        child: bottomNavigationBar,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text(
                    'Hi, David 👋',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Explore the world',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 36),
              child: TextFormField(
                  decoration: InputDecoration(
                labelText: 'Search Places',
                suffixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    'asset/images/icon_setting.png',
                    height: 16,
                    width: 16,
                  ),
                ),
                border: const OutlineInputBorder(),
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular places',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text('View all'),
                  ),
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
