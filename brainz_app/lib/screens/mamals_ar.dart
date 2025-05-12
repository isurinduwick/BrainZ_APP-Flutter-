import 'package:flutter/material.dart';
import 'package:brainz_app/screens/home.dart';
import 'package:brainz_app/screens/dashboard.dart';
import 'package:brainz_app/model/animal_ar_model.dart';
import 'package:brainz_app/model/ar_view_widget.dart';

class MamalsARScreen extends StatelessWidget {
  const MamalsARScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A4A5C),
        title: const Text('Mammals AR Experience'),
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
                    "Mammals AR",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Select a mammal to view in AR"),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3, // Changed to 3 columns like predators
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 1.2,
                      children: [
                        _buildMammalButton(context, "Elephant"),
                        _buildMammalButton(context, "Lion"),
                        _buildMammalButton(context, "Giraffe"),
                        _buildMammalButton(context, "Monkey"),
                        _buildMammalButton(context, "Kangaroo"),
                        _buildMammalButton(context, "Bear"),
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

  Widget _buildMammalButton(BuildContext context, String name) {
    // Get the animal model - exactly like predators_ar.dart does
    final animal = AnimalARModel.getAnimalByName(name);

    // Use ElevatedButton instead of Card to match predator AR style
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
        // Show AR view when a mammal is selected - exactly like predators_ar.dart
        if (animal.isAvailable) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ARViewWidget(
                animal: animal,
                showMovementControls: true,
              ),
            ),
          );
        } else {
          // For unavailable mammals, show coming soon message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$name AR coming soon!')),
          );
        }
      },
      child: Center(
        child: Text(
          name,
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
