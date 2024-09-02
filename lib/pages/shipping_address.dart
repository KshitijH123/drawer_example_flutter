import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  List<String> _addresses = [];

  void _addAddress(String address) {
    setState(() {
      _addresses.add(address);
    });
  }

  void _deleteAddress(int index) {
    setState(() {
      _addresses.removeAt(index);
    });
  }

  void _editAddress(int index) async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipping Addresses'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.deepOrangeAccent,
                    Colors.blue,
                    Colors.purple,
                    Colors.deepPurple,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  final newAddress = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddAddressPage()),
                  );
                  if (newAddress != null) {
                    _addAddress(newAddress);
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent, 
                  shadowColor: Colors.transparent, 
                  minimumSize: const Size(double.infinity, 50), 
                ),
                child: const Text('Add New Address'),
              ),
            ),
          ),
          Expanded(
            child: _addresses.isEmpty
                ? Center(
                    child: Text(
                      'No addresses available.',
                      style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
                    ),
                  )
                : ListView.builder(
                    itemCount: _addresses.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                _addresses[index],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _deleteAddress(index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors
                                          .transparent, backgroundColor: Colors
                                          .transparent, 
                                      shadowColor:
                                          Colors.transparent, 
                                    ).copyWith(
                                      side: WidgetStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                          width: 2,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 20.0),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [Colors.black, Colors.black38],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  // Edit button
                                  ElevatedButton(
                                    onPressed: () {
                                      _editAddress(index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors
                                          .transparent, backgroundColor: Colors
                                          .transparent,
                                      shadowColor:
                                          Colors.transparent, 
                                    ).copyWith(
                                      side: WidgetStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                          width: 2,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 24.0),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [Colors.blue, Colors.purple],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}


class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Address',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your address',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final newAddress = _addressController.text;
                if (newAddress.isNotEmpty) {
                  Navigator.pop(context, newAddress);
                }
              },
              child: const Text('Add Address'),
            ),
          ],
        ),
      ),
    );
  }
}
