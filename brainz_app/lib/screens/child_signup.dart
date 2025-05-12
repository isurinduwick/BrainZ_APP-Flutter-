import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import 'child_login.dart';

class ChildSignUp extends StatefulWidget {
  const ChildSignUp({super.key});

  @override
  State<ChildSignUp> createState() => _ChildSignUpState();
}

class _ChildSignUpState extends State<ChildSignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage;

  bool _validateInputs() {
    // Check username length
    if (_usernameController.text.length < 3) {
      setState(() {
        _errorMessage = 'Username must be at least 3 characters';
      });
      return false;
    }

    // Check email contains @gmail.com
    if (!_emailController.text.contains('@gmail.com')) {
      setState(() {
        _errorMessage = 'Email must contain @gmail.com';
      });
      return false;
    }

    // Check password is not empty
    if (_passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Password cannot be empty';
      });
      return false;
    }

    setState(() {
      _errorMessage = null;
    });
    return true;
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('User successfully added!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
                  "WELCOME!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Sign up fields
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),

              // Error message display
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  onPressed: () {
                    if (_validateInputs()) {
                      _showSuccessMessage();
                      // Clear the form fields after successful submission
                      _usernameController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                      // No navigation to home page as requested
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_errorMessage ?? 'Please check all fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Sign Up",
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
                      MaterialPageRoute(builder: (_) => const ChildLogin()),
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
