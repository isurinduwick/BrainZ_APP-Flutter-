import 'package:flutter/material.dart';
import 'package:brainz_app/screens/home.dart';
import 'package:brainz_app/screens/dashboard.dart';
import 'package:brainz_app/model/animal_ar_model.dart';
import 'package:brainz_app/model/ar_view_widget.dart';

class BirdsARScreen extends StatelessWidget {
  const BirdsARScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A4A5C),
        title: const Text('Birds AR Experience'),
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
                    "Birds AR",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Select a bird to view in AR"),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 1.2,
                      children: [
                        _buildBirdButton(context, "Parrot"),
                        _buildBirdButton(context, "Peacock"),
                        _buildBirdButton(context, "Eagle"),
                        _buildBirdButton(context, "Hawk"),
                        _buildBirdButton(context, "Falcon"),
                        _buildBirdButton(context, "Owl"),
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

  Widget _buildBirdButton(BuildContext context, String name) {
    final animal = AnimalARModel.getAnimalByName(name);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3A4A5C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        padding: const EdgeInsets.all(8),
      ),
      onPressed: () {
        if (animal.isAvailable) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ARViewWidget(
                animal: animal,
                showFlightControls: true,
              ),
            ),
          );
        } else {
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
