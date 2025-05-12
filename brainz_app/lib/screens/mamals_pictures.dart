import 'package:flutter/material.dart';
import 'package:brainz_app/screens/home.dart';
import 'package:brainz_app/screens/dashboard.dart';

class MamalsPicturesScreen extends StatelessWidget {
  const MamalsPicturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC), // Light blue background
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A4A5C),
        title: const Text('Mammal Pictures'),
        elevation: 0,
      ),
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
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Mammals header
                  const Text(
                    "Mammals",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Mammal grid
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      children: [
                        _buildMammalCard("Elephant"),
                        _buildMammalCard("Lion"),
                        _buildMammalCard("Giraffe"),
                        _buildMammalCard("Monkey"),
                        _buildMammalCard("Kangaroo"),
                        _buildMammalCard("Bear"),
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

  Widget _buildMammalCard(String name) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.pets, size: 50, color: Color(0xFF3A4A5C)),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
