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
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_add, size: 24),
            onPressed: () {
              print('Notification Icon Pressed');
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
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.window),
            label: 'Window',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Git',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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

  List<Map<String, String>> _getFilteredItems() {
    final allItems = [
      {'title': 'Electric Switch Button 1', 'imageUrl': 'https://5.imimg.com/data5/SELLER/Default/2022/11/RC/AE/YF/43448572/penite-electric-switch-button-500x500.jpg', 'category': 'Switches', 'price': '\₹30'},
      {'title': 'Electric Switch Button 2', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP41vK0SW0qeKY4DlLyO1OMdik6s40QZDx2w&s', 'category': 'Switches', 'price': '\₹100'},
      {'title': 'Electric Switch Button 3', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwLiN9VKip9sd9jSVJ_kKWXtGfqxd0Bp-Dpg&s', 'category': 'Door Locks', 'price': '\₹150'},
      {'title': 'Electric Switch Button 4', 'imageUrl': 'https://d2hucwwplm5rxi.cloudfront.net/wp-content/uploads/2022/09/12111755/car-door-parts-_-Body-2-12-9-22-1024x640.jpg', 'category': 'Car Door', 'price': '\₹600'},
      {'title': 'Electric Switch Button 5', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU5rMkqq1UQX5-cZhozt5IolO6g4FWw9DWgg&s', 'category': 'All', 'price': '\₹100'},
      {'title': 'Electric Switch Button 6', 'imageUrl': 'https://rukminim2.flixcart.com/image/400/400/xif0q/car-cradle/clip/a/n/n/igrip-telescopic-one-touch-amkette-original-imagqhhn9guzgyzc.jpeg?q=90&crop=false', 'category': 'All', 'price': '\₹980'},
    ];

    return _selectedButtonLabel == 'All'
        ? allItems
        : allItems.where((item) => item['category'] == _selectedButtonLabel).toList();
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

  Widget _buildCard(
      {required String imageUrl,
      required String title,
      required String price}) {
    return Card(
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
    );
  }
}
