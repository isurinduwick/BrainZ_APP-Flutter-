import 'package:flutter/material.dart';
import 'package:brainz_app/screens/home.dart';
import 'package:brainz_app/screens/dashboard.dart';

class BirdsQuizzScreen extends StatelessWidget {
  const BirdsQuizzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A4A5C),
        title: const Text('Birds Quiz'),
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
                  const Text(
                    "Birds Quiz",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Coming soon! Test your knowledge about birds with our interactive quiz.",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),

            // Mascot at bottom-right
            Positioned(
              bottom: 10,
              right: 10,
              child: Image.asset(
                'assets/sideimg.png',
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
}
