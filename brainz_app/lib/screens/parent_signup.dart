import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import 'parent_login.dart';
// ignore: unused_import
import 'home.dart';

class ParentSignUp extends StatefulWidget {
  const ParentSignUp({super.key});

  @override
  State<ParentSignUp> createState() => _ParentSignUpState();
}

class _ParentSignUpState extends State<ParentSignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;

  void _validateAndSubmit() {
    bool isValid = true;

    // Validate name (at least 3 characters)
    if (_nameController.text.length < 3) {
      setState(() {
        _nameError = 'Name must be at least 3 characters';
      });
      isValid = false;
    } else {
      setState(() {
        _nameError = null;
      });
    }

    // Validate email (must contain @gmail.com)
    if (!_emailController.text.contains('@gmail.com')) {
      setState(() {
        _emailError = 'Email must contain @gmail.com';
      });
      isValid = false;
    } else {
      setState(() {
        _emailError = null;
      });
    }

    // Validate password (has some content)
    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordError = 'Password is required';
      });
      isValid = false;
    } else {
      setState(() {
        _passwordError = null;
      });
    }

    // If all validations pass, show success message
    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data saved'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.gradientBackground,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 20),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),

              // Logo - centered
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Image.asset(
                  'assets/logo.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),

              // Title in white - centered
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "PARENT SIGN UP",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Sign up fields
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  filled: true,
                  fillColor: Colors.white70,
                  border: const OutlineInputBorder(),
                  errorText: _nameError,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white70,
                  border: const OutlineInputBorder(),
                  errorText: _emailError,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white70,
                  border: const OutlineInputBorder(),
                  errorText: _passwordError,
                ),
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // Black sign-up button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _validateAndSubmit,
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              // OR separator
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(color: Colors.white70, thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(color: Colors.white70, thickness: 1)),
                  ],
                ),
              ),

              // Social media login row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.google),
                    iconSize: 30,
                    color: Colors.red,
                    onPressed: () {
                      // Google signup logic
                    },
                  ),
                  const SizedBox(width: 24),
                  // Facebook
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.facebook),
                    iconSize: 30,
                    color: Colors.blue[900],
                    onPressed: () {
                      // Facebook signup logic
                    },
                  ),
                  const SizedBox(width: 24),
                  // Instagram
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.instagram),
                    iconSize: 30,
                    color: Colors.purple,
                    onPressed: () {
                      // Instagram signup logic
                    },
                  ),
                ],
              ),

              // Sign-in link - centered
              const SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ParentLogin()),
                    );
                  },
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
