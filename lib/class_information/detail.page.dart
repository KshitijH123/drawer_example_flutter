import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;
  final String rating;

  const DetailPage({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.rating,
    super.key,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    print(_isFavorited ? 'Added to Favorites' : 'Removed from Favorites');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        icon: Icon(
                          _isFavorited
                              ? Icons.favorite
                              : Icons.favorite_outline_outlined,
                          color: _isFavorited ? Colors.red[400] : Colors.grey,
                        ),
                        onPressed: _toggleFavorite,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.rating,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 60),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.yellow[400],
                            ),
                            onPressed: () {
                              print('Added to Cart');
                            },
                            label: const Text(
                              'Add to Cart',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 60),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.orange[400],
                            ),
                            onPressed: () {
                              print('Buy Now');
                            },
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
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
