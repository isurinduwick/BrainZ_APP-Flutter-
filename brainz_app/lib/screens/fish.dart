import 'package:flutter/material.dart';
import 'package:brainz_app/screens/home.dart';
import 'package:brainz_app/screens/dashboard.dart';
import 'fish_ar.dart';
import 'fish_quizz.dart';
import 'fish_pictures.dart';
import 'package:brainz_app/model/animal_ar_model.dart';
import 'package:brainz_app/model/ar_view_widget.dart';

class FishScreen extends StatelessWidget {
  const FishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC), // Light blue background
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User profile section
                  Row(
                    children: [
                      // Profile image
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      const SizedBox(width: 10),
                      // User name and points
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Johnny",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "10",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Settings icon
                      IconButton(
                        icon: const Icon(Icons.settings_rounded, size: 30),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Category title
                  const Text(
                    "Fish",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Increase spacing to move buttons lower
                  const SizedBox(height: 80), // Changed from 40 to 80

                  // Action buttons
                  _buildActionButton(context, "Pictures", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FishPicturesScreen()),
                    );
                  }),
                  const SizedBox(height: 16),
                  _buildActionButton(context, "AR", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FishARScreen()),
                    );
                  }),
                  const SizedBox(height: 16),
                  _buildActionButton(context, "AR Aquarium", () {
                    _showARSelectionDialog(context);
                  }),
                  const SizedBox(height: 16),
                  _buildActionButton(context, "Quizz", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const FishQuizzScreen()),
                    );
                  }),
                  const SizedBox(height: 16),
                  _buildActionButton(context, "Details", () {}),
                ],
              ),
            ),

            // Mascot at bottom-right
            Positioned(
              bottom: 10,
              right: 10,
              child: Image.asset(
                'assets/sideimg.png', // Pink mascot image
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Dashboard()),
            );
          } else if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Home()),
            );
          }
        },
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, String title, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3A4A5C), // Dark blue-gray color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          shadowColor: Colors.black54,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Show dialog to select a fish for AR quick view
  void _showARSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select a Fish for AR Aquarium"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildARSelectionTile(context, "Goldfish"),
                _buildARSelectionTile(context, "Clownfish"),
                _buildARSelectionTile(context, "Shark"),
                _buildARSelectionTile(context, "Salmon"),
                _buildARSelectionTile(context, "Angelfish"),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Build individual fish selection tile for AR viewing
  Widget _buildARSelectionTile(BuildContext context, String fishName) {
    return ListTile(
      leading: const Icon(Icons.water, color: Color(0xFF3A4A5C)),
      title: Text(fishName),
      onTap: () {
        final animal = AnimalARModel.getAnimalByName(fishName);
        Navigator.of(context).pop();
        if (animal.isAvailable) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ARViewWidget(
                animal: animal,
                showSwimControls: true, // Enable swimming animation controls
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$fishName AR model coming soon!')),
          );
        }
      },
    );
  }
}
