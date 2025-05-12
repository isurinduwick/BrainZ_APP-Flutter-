import 'package:flutter/material.dart';
import 'package:brainz_app/screens/home.dart';
import 'package:brainz_app/screens/dashboard.dart';
import 'package:brainz_app/screens/tigerquizz.dart'; // Add this import

class PredictorsQuizzScreen extends StatelessWidget {
  const PredictorsQuizzScreen({super.key});

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

                  // Page title
                  const Text(
                    "Predators Quiz",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Animals quiz grid
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 1.2,
                      children: [
                        _buildAnimalButton(context, "Lion"),
                        _buildAnimalButton(context, "Tiger"),
                        _buildAnimalButton(context, "Eagle"),
                        _buildAnimalButton(context, "Leopard"),
                        _buildAnimalButton(context, "Wolve"),
                        _buildAnimalButton(context, "Python"),
                        _buildAnimalButton(context, "Orca"),
                        _buildAnimalButton(context, "Hawk"),
                        _buildAnimalButton(context, "Falcon"),
                        _buildAnimalButton(context, "Crocodile"),
                        _buildAnimalButton(context, "Anaconda"),
                        _buildAnimalButton(context, "Cheetah"),
                      ],
                    ),
                  ),
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

  Widget _buildAnimalButton(BuildContext context, String animalName) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3A4A5C), // Dark blue-gray color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        padding: const EdgeInsets.all(8),
      ),
      onPressed: () {
        // Special handling for Tiger
        if (animalName == "Tiger") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TigerQuizScreen()),
          );
        } else {
          // Show quiz for other animals
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$animalName Quiz coming soon!')));
        }
      },
      child: Center(
        child: Text(
          animalName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
