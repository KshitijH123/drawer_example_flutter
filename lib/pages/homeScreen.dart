import 'package:drawer_example_flutter/class_information/detail.page.dart';
import 'package:drawer_example_flutter/pages/edit_profile.dart';
import 'package:drawer_example_flutter/pages/qr_scanner.dart';
import 'package:drawer_example_flutter/pages/shipping_address.dart';
import 'package:flutter/material.dart';

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
        selectedItemColor: Colors.red[600],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Column(
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
          const SizedBox(height: 16),
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: PageView(
              controller: _pageController,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
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
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      'https://t4.ftcdn.net/jpg/02/61/01/87/360_F_261018762_f15Hmze7A0oL58Uwe7SrDKNS4fZIjLiF.jpg',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
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
                    borderRadius: BorderRadius.circular(40),
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
          const SizedBox(height: 16),
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
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Recently Added',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
        ],
      ),
    );
  }

 Widget _buildCategoriesScreen() {
    return SingleChildScrollView(
      child: Column(
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
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Products & Services',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 120, 
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildAvatarWithLabel(
                    'https://www.chinadaier.com/wp-content/uploads/2022/08/TOGGLE-SWITCH.jpg.webp',
                    'Switch',
                  ),
                  const SizedBox(width: 18),
                  _buildAvatarWithLabel(
                    'https://www.autodeal.com.ph/custom/blog-post/header/types-of-door-handles-620cc36819e84.jpg',
                    'Door Handle',
                  ),
                  const SizedBox(width: 18),
                  _buildAvatarWithLabel(
                    'https://www.maypoleltd.com/wp-content/uploads/2019/09/5494_5.jpg',
                    'Light',
                  ),
                  const SizedBox(width: 18),
                  _buildAvatarWithLabel(
                    'https://m.media-amazon.com/images/I/71GV627s4YL._AC_UF1000,1000_QL80_.jpg',
                    'Tool',
                  ),
                   const SizedBox(width: 18),
                  _buildAvatarWithLabel(
                    'https://www.autodeal.com.ph/custom/blog-post/header/types-of-door-handles-620cc36819e84.jpg',
                    'Door Handle',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Recently Added',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
        ],
      ),
    );
  }

  Widget _buildAvatarWithLabel(String imageUrl, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildRewardsScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.redAccent,
            child: const Text(
              '🎁 Get Your Reward Here 🎁',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          const Text(
            'Scan QR Code',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScannerScreen()),
              );
            },
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.blueAccent.withOpacity(0.2),
              child: const Icon(
                Icons.qr_code_scanner,
                size: 120,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileScreen() {
    return Center(
      child: Container(
        color: Colors.white54,
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildProfileCard(),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                     print('My Order tapped');
                    },
                    child: _buildRow('My Order', Icons.shopping_cart_outlined),
                  ),
                  InkWell(
                    onTap: () {
                      print('My Favorite tapped');
                    },
                    child: _buildRow(
                        'My Favorite', Icons.favorite_border_outlined),
                  ),
                  InkWell(
                    onTap: () {
                      print('Credit & Coupons tapped');
                    },
                    child: _buildRow('Credit & Coupons', Icons.card_membership),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippingAddress()),
                      );
                    },
                    child: _buildRow(
                        'Shipping Address', Icons.location_on_outlined),
                  ),
                  InkWell(
                    onTap: () {
                      print('Account Settings tapped');
                    },
                    child:
                        _buildRow('Account Settings', Icons.settings_outlined),
                  ),
                  InkWell(
                    onTap: () {
                      print('Log Out tapped');
                    },
                    child: _buildRow('Log Out', Icons.logout),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Terms & conditions'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 5,
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/f8239007-7d36-45ce-a0a1-fdf91052b10e/299f5e14-73c4-4a9b-99c9-e44adbc218cf.png'),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Kshitij Hapase',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'GOLD    1200 POINTS',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    LinearProgressIndicator(
                      value: 0.7,
                      minHeight: 5.0,
                      backgroundColor: Colors.grey[200],
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          left: 16.0,
          right: 16.0,
          child: Text(
            'Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ),
        Positioned(
          top: 8.0,
          right: 8.0,
          child: IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EditProfile()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            icon,
            size: 24,
          ),
        ],
      ),
    );
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
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
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
