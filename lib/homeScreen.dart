import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  String? _selectedButtonLabel;

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
                      width: MediaQuery.of(context)
                          .size
                          .width, 
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
                      width: MediaQuery.of(context)
                          .size
                          .width, 
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
                  // Add more buttons here if needed
                ],
              ),
            ),
          ),
          SizedBox(height: 8), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Recently Added',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7), 
              ),
            ),
          ),
          SizedBox(height: 16), 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16, 
                  mainAxisSpacing: 16, 
                  childAspectRatio: 0.75, 
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  String imageUrl;
                  if (index == 1) {
                    imageUrl =
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP41vK0SW0qeKY4DlLyO1OMdik6s40QZDx2w&s';
                  } else if (index == 2) {
                    imageUrl =
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwLiN9VKip9sd9jSVJ_kKWXtGfqxd0Bp-Dpg&s';
                  } else if (index == 3) {
                    imageUrl =
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqTAJcpGGTvMEzWonXEQHjXjZIeVq5ng2jww&s';
                  } else if (index == 4) {
                    imageUrl =
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU5rMkqq1UQX5-cZhozt5IolO6g4FWw9DWgg&s';
                  } else if (index == 5) {
                    imageUrl =
                        'https://rukminim2.flixcart.com/image/400/400/xif0q/car-cradle/clip/a/n/n/igrip-telescopic-one-touch-amkette-original-imagqhhn9guzgyzc.jpeg?q=90&crop=falsehttps://rukminim2.flixcart.com/image/400/400/xif0q/car-cradle/clip/a/n/n/igrip-telescopic-one-touch-amkette-original-imagqhhn9guzgyzc.jpeg?q=90&crop=false';
                  }
                  else {
                    imageUrl =
                        'https://5.imimg.com/data5/SELLER/Default/2022/11/RC/AE/YF/43448572/penite-electric-switch-button-500x500.jpg';
                  }
                  return _buildCard(
                    imageUrl: imageUrl,
                    title: 'Electric Switch Button ${index + 1}',
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

  Widget _buildButton(String label) {
    bool isSelected = _selectedButtonLabel == label;
    return GestureDetector(
      onTap: () => _onButtonTapped(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Colors.red
                  : Colors.black, // Text color changes on tap
              fontWeight: FontWeight.bold,
              fontSize: 16, // Adjust font size as needed
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String imageUrl, required String title}) {
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
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
