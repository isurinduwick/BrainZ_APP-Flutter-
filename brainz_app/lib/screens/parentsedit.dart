import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class ParentEditScreen extends StatefulWidget {
  const ParentEditScreen({super.key});

  @override
  State<ParentEditScreen> createState() => _ParentEditScreenState();
}

class _ParentEditScreenState extends State<ParentEditScreen> {
  // Controllers for text fields
  final TextEditingController _nameController =
      TextEditingController(text: 'Anne');
  final TextEditingController _emailController =
      TextEditingController(text: 'Anne@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '********');
  final TextEditingController _childNameController =
      TextEditingController(text: 'Johnny');

  // Form state variables
  String _selectedRelationship = 'Mother';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _childNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.settings_rounded, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        decoration: AppTheme.gradientBackground,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 26.1, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile picture
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white70,
                      backgroundImage: const AssetImage('assets/anne.png'),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                icon: const Icon(Icons.add_a_photo,
                                    color: Colors.white, size: 20),
                                onPressed: () {
                                  // Handle profile picture change
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Display name
                  Text(
                    _nameController.text,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    _emailController.text,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                  ),

                  const SizedBox(height: 40),

                  // Form fields
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Add a Profile Picture
                        GestureDetector(
                          onTap: () {
                            // Handle adding profile picture
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.add_circle_outline,
                                  color: Colors.white),
                              SizedBox(width: 12),
                              Text(
                                "Add a Profile Picture",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Username field
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                                width: 120,
                                child: Text("User Name:",
                                    style: TextStyle(color: Colors.white, fontSize: 15))),
                            Expanded(
                              child: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  // ignore: deprecated_member_use
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Email field
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                                width: 120,
                                child: Text("Email:",
                                    style: TextStyle(color: Colors.white, fontSize: 15))),
                            Expanded(
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  // ignore: deprecated_member_use
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Password field
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                                width: 120,
                                child: Text("Password:",
                                    style: TextStyle(color: Colors.white, fontSize: 15))),
                            Expanded(
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  // ignore: deprecated_member_use
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Relationship to Child
                        const Text("Relationship to the Child:",
                            style: TextStyle(color: Colors.white, fontSize: 15)),
                        
                        const SizedBox(height: 8),

                        // Radio options in a more spaced layout
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Wrap(
                            spacing: 16.0,
                            runSpacing: 8.0,
                            children: [
                              // Father option
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      value: 'Father',
                                      groupValue: _selectedRelationship,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedRelationship = value.toString();
                                        });
                                      },
                                      // ignore: deprecated_member_use
                                      fillColor: MaterialStateProperty.all(Colors.white),
                                    ),
                                    const Text('Father',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              // Mother option
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      value: 'Mother',
                                      groupValue: _selectedRelationship,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedRelationship = value.toString();
                                        });
                                      },
                                      // ignore: deprecated_member_use
                                      fillColor: MaterialStateProperty.all(Colors.white),
                                    ),
                                    const Text('Mother',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              // Guardian option
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      value: 'Guardian',
                                      groupValue: _selectedRelationship,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedRelationship = value.toString();
                                        });
                                      },
                                      // ignore: deprecated_member_use
                                      fillColor: MaterialStateProperty.all(Colors.white),
                                    ),
                                    const Text('Guardian',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Child's Details
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Child's Details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // ignore: deprecated_member_use
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Child name field with character
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                                width: 100,
                                child: Text("Name:",
                                    style: TextStyle(color: Colors.white))),
                            Expanded(
                              child: TextField(
                                controller: _childNameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  // ignore: deprecated_member_use
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Cute character image
                            Image.asset(
                              'assets/sideimg.png',
                              width: 70,
                              height: 70,
                            ),
                          ],
                        ),
                
                        const SizedBox(height: 16),
                        
                        // Profile link
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to child's profile
                            },
                            child: const Text(
                              "Go to the Profile",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Save and Cancel buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Save profile changes
                            Navigator.pop(context);
                          },
                          child: const Text('Save',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Cancel and go back
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
