import 'package:drawer_example_flutter/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:drawer_example_flutter/class_information/detail.page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  String _selectedButtonLabel = 'All';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print('Selected Index: $index');
  }

  void _onButtonTapped(String label) {
    setState(() {
      _selectedButtonLabel = label;
    });
    print('Button Tapped: $label');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/jay.png',
          height: 60,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, size: 30),
            onPressed: () {
              print('Notification Icon Pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded, size: 30),
            onPressed: () {
              print('Heart Icon Pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, size: 30),
            onPressed: () {
              print('Shopping Icon Pressed');
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeScreen(),
          _buildCategoriesScreen(),
          _buildRewardsScreen(context),
          _buildProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.window_rounded, size: 30),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined, size: 30),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
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
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 150,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: PageView(
            controller: _pageController,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://t4.ftcdn.net/jpg/02/61/01/87/360_F_261018762_f15Hmze7A0oL58Uwe7SrDKNS4fZIjLiF.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://t4.ftcdn.net/jpg/03/98/21/07/360_F_398210729_GADy7kthTgJCLyIDNr2IB8D1bSzZcL8j.jpg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildButton('All'),
                SizedBox(width: 16),
                _buildButton('Switches'),
                SizedBox(width: 16),
                _buildButton('Door Locks'),
                SizedBox(width: 16),
                _buildButton('Car Door'),
              ],
            ),
          ),
        ),
        SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Recently Added',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: _getFilteredItems().length,
              itemBuilder: (context, index) {
                final item = _getFilteredItems()[index];
                return _buildCard(
                  imageUrl: item['imageUrl']!,
                  title: item['title']!,
                  price: item['price']!,
                  description: item['description']!,
                  rating: item['rating']!,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesScreen() {
    return Center(child: Text('Categories Screen'));
  }

Widget _buildRewardsScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScannerScreen()),
              );
            },
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.blueAccent.withOpacity(0.2),
              child: Icon(
                Icons.qr_code_scanner,
                size: 80,
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Scan QR Code',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.redAccent,
            child: Text(
              '🎁 Get Your Reward Here 🎁',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileScreen() {
    return Center(child: Text('Profile Screen'));
  }

  List<Map<String, String>> _getFilteredItems() {
    final allItems = [
      {
        'title': 'Electric Switch Button',
        'imageUrl':
            'https://www.chinadaier.com/wp-content/uploads/2019/08/pro2.jpg',
        'category': 'Switches',
        'price': '\₹30',
        'description':
            'AD2212 Round 12v DC 10A 250VAC Push Button On Off Switch for Electric Kids Car E-Bike Toys (Pack of 2, Multicolour).',
        'rating': '4.6 Store Rating (603 reviews)',
      },
      {
        'title': 'Electric Switch Button',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP41vK0SW0qeKY4DlLyO1OMdik6s40QZDx2w&s',
        'category': 'Switches',
        'price': '\₹100',
        'description':
            'High-quality switch with durable design suitable for various applications.',
        'rating': '4.8 Store Rating (150 reviews)',
      },
      {
        'title': 'Door Lock',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwLiN9VKip9sd9jSVJ_kKWXtGfqxd0Bp-Dpg&s',
        'category': 'Door Locks',
        'price': '\₹150',
        'description':
            'Door locks are mechanical devices that keep doors closed and secure. They can be opened with keys, electronic cards, or secret numbers.',
        'rating': '4.7 Store Rating (200 reviews)',
      },
      {
        'title': 'Car Door',
        'imageUrl':
            'https://d2hucwwplm5rxi.cloudfront.net/wp-content/uploads/2022/09/12111755/car-door-parts-_-Body-2-12-9-22-1024x640.jpg',
        'category': 'Car Door',
        'price': '\₹600',
        'description':
            'Premium car door with robust build quality and sleek design.',
        'rating': '4.5 Store Rating (300 reviews)',
      },
      {
        'title': 'Radio Switch',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU5rMkqq1UQX5-cZhozt5IolO6g4FWw9DWgg&s',
        'category': 'All',
        'price': '\₹100',
        'description':
            'Versatile radio switch with multiple settings and high durability.',
        'rating': '4.4 Store Rating (250 reviews)',
      },
      {
        'title': 'Mobile Holder',
        'imageUrl':
            'https://rukminim2.flixcart.com/image/400/400/xif0q/car-cradle/clip/a/n/n/igrip-telescopic-one-touch-amkette-original-imagqhhn9guzgyzc.jpeg?q=90&crop=false',
        'category': 'All',
        'price': '\₹200',
        'description':
            'Adjustable mobile handler for secure and convenient phone holding.',
        'rating': '4.3 Store Rating (180 reviews)',
      },
    ];

    return _selectedButtonLabel == 'All'
        ? allItems
        : allItems
            .where((item) => item['category'] == _selectedButtonLabel)
            .toList();
  }

  Widget _buildButton(String label) {
    bool isSelected = _selectedButtonLabel == label;
    return GestureDetector(
      onTap: () => _onButtonTapped(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.grey,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String imageUrl,
    required String title,
    required String price,
    required String description,
    required String rating,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imageUrl: imageUrl,
              title: title,
              price: price,
              description: description,
              rating: rating,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
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
