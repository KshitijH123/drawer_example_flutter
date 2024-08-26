import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _accountTypeController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _accountTypeFocusNode = FocusNode();

  Color _nameBorderColor = Colors.grey;
  Color _emailBorderColor = Colors.grey;
  Color _phoneBorderColor = Colors.grey;
  Color _accountTypeBorderColor = Colors.grey;

  @override
  void initState() {
    super.initState();

    _nameFocusNode.addListener(() {
      setState(() {
        _nameBorderColor = _nameFocusNode.hasFocus ? Colors.red : Colors.grey;
      });
    });

    _emailFocusNode.addListener(() {
      setState(() {
        _emailBorderColor = _emailFocusNode.hasFocus ? Colors.red : Colors.grey;
      });
    });

    _phoneFocusNode.addListener(() {
      setState(() {
        _phoneBorderColor = _phoneFocusNode.hasFocus ? Colors.red : Colors.grey;
      });
    });

    _accountTypeFocusNode.addListener(() {
      setState(() {
        _accountTypeBorderColor =
            _accountTypeFocusNode.hasFocus ? Colors.red : Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _accountTypeController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _accountTypeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: const NetworkImage(
                        'https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/f8239007-7d36-45ce-a0a1-fdf91052b10e/299f5e14-73c4-4a9b-99c9-e44adbc218cf.png',
                      ),
                      backgroundColor: Colors.grey[200],
                    ),
                    Positioned(
                      bottom: 5,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.blueGrey,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                'Kshitij Hapase',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Center(
              child: Text('Edit Profile'),
            ),
            const SizedBox(height: 30.0), // Increased space before new section

            const Text(
              'Full Name',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _nameController,
              focusNode: _nameFocusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: _nameBorderColor),
                ),
                hintText: 'Enter your full name',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Email Address',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintText: 'Enter your email address',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Phone Number',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _phoneController,
              focusNode: _phoneFocusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintText: 'Enter your phone number',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Account Type',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _accountTypeController,
              focusNode: _accountTypeFocusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintText: 'Enter your account type',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
