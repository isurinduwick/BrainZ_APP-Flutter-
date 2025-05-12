import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers for text fields
  final TextEditingController _nameController =
      TextEditingController(text: 'Johnny');
  final TextEditingController _emailController =
      TextEditingController(text: 'johnny@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '********');
  final TextEditingController _guardianNameController =
      TextEditingController(text: 'Anne');

  // Form state variables
  String _selectedGender = 'Male';
  String _selectedAge = '5';

  // List of ages for dropdown
  final List<String> _ages = List.generate(18, (index) => '${index + 1}');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _guardianNameController.dispose();
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
        title:
            const Text('Edit Profile', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: AppTheme.gradientBackground,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile picture
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white70,
                    backgroundImage: const AssetImage('assets/profile.png'),
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

                  const SizedBox(height: 10),

                  // Display name
                  Text(
                    _nameController.text,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    _emailController.text,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                  ),

                  const SizedBox(height: 30),

                  // Form fields
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
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
                              SizedBox(width: 10),
                              Text(
                                "Add a Profile Picture",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Username field
                        Row(
                          children: [
                            const SizedBox(
                                width: 120,
                                child: Text("User Name:",
                                    style: TextStyle(color: Colors.white))),
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
                                      horizontal: 16),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Email field
                        Row(
                          children: [
                            const SizedBox(
                                width: 120,
                                child: Text("Email:",
                                    style: TextStyle(color: Colors.white))),
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
                                      horizontal: 16),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Password field
                        Row(
                          children: [
                            const SizedBox(
                                width: 120,
                                child: Text("Password:",
                                    style: TextStyle(color: Colors.white))),
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
                                      horizontal: 16),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Gender selection
                        Row(
                          children: [
                            const SizedBox(
                                width: 120,
                                child: Text("Gender:",
                                    style: TextStyle(color: Colors.white))),
                            Radio(
                              value: 'Male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value.toString();
                                });
                              },
                              fillColor:
                                  // ignore: deprecated_member_use
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            const Text('Male',
                                style: TextStyle(color: Colors.white)),
                            const SizedBox(width: 20),
                            Radio(
                              value: 'Female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value.toString();
                                });
                              },
                              fillColor:
                                  // ignore: deprecated_member_use
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            const Text('Female',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Age dropdown
                        Row(
                          children: [
                            const SizedBox(
                                width: 120,
                                child: Text("Age:",
                                    style: TextStyle(color: Colors.white))),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<String>(
                                value: _selectedAge,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.white),
                                dropdownColor: Colors.blue,
                                underline: Container(),
                                style: const TextStyle(color: Colors.white),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedAge = newValue!;
                                  });
                                },
                                items: _ages.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Guardian/Parent Details
                  Text(
                    "Guardian/Parent Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Parent name field with pink character
                  Row(
                    children: [
                      const SizedBox(
                          width: 100,
                          child: Text("Name:",
                              style: TextStyle(color: Colors.white))),
                      Expanded(
                        child: TextField(
                          controller: _guardianNameController,
                          decoration: InputDecoration(
                            filled: true,
                            // ignore: deprecated_member_use
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      // Pink character
                      Image.asset(
                        'assets/sideimg.png',
                        width: 80,
                        height: 80,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Link to go to Profile
                  TextButton(
                    onPressed: () {
                      // Navigate to profile view
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Go to the Profile",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Save and Cancel buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
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
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
