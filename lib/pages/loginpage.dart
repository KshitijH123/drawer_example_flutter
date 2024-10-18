import 'package:drawer_example_flutter/pages/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final String email = 'kshitijhapase@gmail.com';
  final String password = 'Kshitij@123';

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/xyz.png'),
                        radius: 100,
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter an email'
                                : null;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border:const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter a password'
                                : null;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        onPressed: validateForm,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Forgot Password?'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      final eml = emailController.text;
      final passwd = passwordController.text;

      if (passwd == password && eml == email) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        _showDialog('Login Failed', 'Invalid email or password');
      }
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
