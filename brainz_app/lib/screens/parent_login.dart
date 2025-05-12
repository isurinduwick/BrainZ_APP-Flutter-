import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import 'parent_signup.dart';
import 'parenthome.dart'; // Import the parent home screen

class ParentLogin extends StatefulWidget {
  const ParentLogin({super.key});

  @override
  State<ParentLogin> createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _showError = false;

  void _authenticateUser() {
    // Hardcoded credentials
    const String validUsername = 'anne';
    const String validPassword = '12345';

    if (_emailController.text == validUsername && 
        _passwordController.text == validPassword) {
      // Clear any errors
      setState(() {
        _showError = false;
        _errorMessage = '';
      });
      // Navigate to parent home on successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ParentHomeScreen()),
      );
    } else {
      // Show error message
      setState(() {
        _showError = true;
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  void dispose() {
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
              // New back button - simpler and more direct
              GestureDetector(
                onTap: () {
                  // Simple direct navigation back to welcome screen
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
                  "WELCOME !",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Email and Password fields with controllers
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Username',
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
              if (_showError)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              const SizedBox(height: 25),

              // Black sign-in button with authentication
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _authenticateUser,
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Implement forgot password functionality
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // OR separator
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
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
                      // Google login logic
                    },
                  ),
                  const SizedBox(width: 24),
                  // Facebook
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.facebook),
                    iconSize: 30,
                    color: Colors.blue[900],
                    onPressed: () {
                      // Facebook login logic
                    },
                  ),
                  const SizedBox(width: 24),
                  // Instagram
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.instagram),
                    iconSize: 30,
                    color: Colors.purple,
                    onPressed: () {
                      // Instagram login logic
                    },
                  ),
                ],
              ),

              // Sign-up link - centered
              const SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to parent sign up page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ParentSignUp()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
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
