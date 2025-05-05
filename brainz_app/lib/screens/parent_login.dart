import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import 'welcome_screen.dart'; // Add this import

class ParentLogin extends StatelessWidget {
  const ParentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.gradientBackground,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Back button
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                ),
              ),
            ),
            // Main content
            SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo at the top - add a bit more top padding to account for the back button
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 60, bottom: 30),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Title in white
                  const Text(
                    "WELCOME !",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email and Password fields
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white70,
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  // Black sign-in button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // Parent login logic
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16),
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
                            child:
                                Divider(color: Colors.white70, thickness: 1)),
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
                            child:
                                Divider(color: Colors.white70, thickness: 1)),
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

                  // Sign-up link
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      // Navigate to parent sign up page
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
