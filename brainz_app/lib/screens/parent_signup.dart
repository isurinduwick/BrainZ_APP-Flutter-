import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import 'parent_login.dart';
import 'home.dart';

class ParentSignUp extends StatelessWidget {
  const ParentSignUp({super.key});

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
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const Home()),
                    );
                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 16),
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
