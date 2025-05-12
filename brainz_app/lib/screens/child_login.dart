import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_theme.dart';
import 'child_signup.dart';
import 'home.dart';

class ChildLogin extends StatefulWidget {
  const ChildLogin({super.key});

  @override
  State<ChildLogin> createState() => _ChildLoginState();
}

class _ChildLoginState extends State<ChildLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateAndLogin() {
    setState(() => _isLoading = true);
    
    // Simulate network delay
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() => _isLoading = false);
      
      if (_usernameController.text == "jonny" && _passwordController.text == "12345") {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context, 
          MaterialPageRoute(builder: (_) => const Home())
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid username or password"),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
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
                  "HELLO!",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),

              // Username and Password fields
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
                controller: _passwordController,
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
                  onPressed: _isLoading ? null : _validateAndLogin,
                  child: _isLoading 
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
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
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.white70,
                      thickness: 1,
                    )),
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
                        child: Divider(
                      color: Colors.white70,
                      thickness: 1,
                    )),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ChildSignUp()));
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
