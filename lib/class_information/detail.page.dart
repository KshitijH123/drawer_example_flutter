import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
                  imageUrl,
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
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red[400],
                        ),
                        onPressed: () {
                          print('Added to Favorites');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    rating,
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
                              minimumSize: const Size(
                                  double.infinity, 60), 
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16), 
                            ),
                            onPressed: () {
                              print('Added to Cart');
                            },
                           
                            label: const Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.red,fontSize: 20),
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
                              minimumSize: const Size(
                                  double.infinity, 60), 
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16), 
                            ),
                            onPressed: () {
                              print('Buy Now');
                            },
                            
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.red,fontSize: 20),
                          
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
