import 'package:flutter/material.dart';
import 'package:brainz_app/screens/home.dart';
import 'package:brainz_app/screens/dashboard.dart';
import 'package:brainz_app/model/animal_ar_model.dart';
import 'package:brainz_app/model/ar_view_widget.dart';

class PredictorsARScreen extends StatelessWidget {
  const PredictorsARScreen({super.key});

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
                    "Augmented Reality (AR)",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Animals AR grid
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3, // Changed from 2 to 3 columns
                      mainAxisSpacing: 12.0, // Reduced spacing
                      crossAxisSpacing: 12.0, // Reduced spacing
                      childAspectRatio:
                          1.2, // Make cells slightly wider than tall
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
    final animal = AnimalARModel.getAnimalByName(animalName);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3A4A5C), // Dark blue-gray color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Reduced from 16
        ),
        elevation: 5, // Reduced from 8
        padding: const EdgeInsets.all(8), // Reduced from 12
      ),
      onPressed: () {
        // Special handling for Tiger AR
        if (animalName == "Tiger") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TigerARView(),
            ),
          );
        } else if (animal.isAvailable) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ARViewWidget(animal: animal)),
          );
        } else {
          // For other animals, just show a coming soon message
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$animalName AR coming soon!')));
        }
      },
      child: Center(
        child: Text(
          animalName,
          style: const TextStyle(
            fontSize: 18, // Reduced from 24
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// New stateful widget for Tiger AR with working rotate and zoom
class TigerARView extends StatefulWidget {
  const TigerARView({super.key});

  @override
  State<TigerARView> createState() => _TigerARViewState();
}

class _TigerARViewState extends State<TigerARView> {
  double _rotation = 0.0;
  double _scale = 1.0;
  
  void _rotateRight() {
    setState(() {
      _rotation += 45.0; // Rotate 45 degrees clockwise
      if (_rotation >= 360.0) {
        _rotation -= 360.0; // Reset after full rotation
      }
    });
  }
  
  void _toggleZoom() {
    setState(() {
      // Toggle between different zoom levels
      if (_scale <= 1.0) {
        _scale = 1.5;
      } else if (_scale <= 1.5) {
        _scale = 2.0;
      } else {
        _scale = 1.0; // Reset to original size
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tiger AR Experience"),
        backgroundColor: const Color(0xFF3A4A5C),
      ),
      body: Stack(
        children: [
          // Mock camera background
          Container(
            color: Colors.black87,
            width: double.infinity,
            height: double.infinity,
          ),
          // Tiger image overlay with transform
          Center(
            child: Transform.scale(
              scale: _scale,
              child: Transform.rotate(
                angle: _rotation * 3.14159 / 180, // Convert degrees to radians
                child: Image.asset(
                  'assets/tigerimg.png',
                  width: 300,
                  height: 300,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: _rotation * 3.14159 / 180,
                          child: Icon(Icons.pets, size: 100, color: Colors.orange),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Tiger AR Mode",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          
          // Information overlay
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      "Rotation: ${_rotation.toStringAsFixed(0)}°",
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Zoom: ${(_scale * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Controls overlay with working functions
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "rotate",
                  onPressed: _rotateRight,
                  backgroundColor: const Color(0xFF3A4A5C),
                  child: const Icon(Icons.rotate_right),
                ),
                FloatingActionButton(
                  heroTag: "zoom",
                  onPressed: _toggleZoom,
                  backgroundColor: const Color(0xFF3A4A5C),
                  child: const Icon(Icons.zoom_in),
                ),
                FloatingActionButton(
                  heroTag: "capture",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('AR Image Captured!'),
                      ),
                    );
                  },
                  backgroundColor: const Color(0xFF3A4A5C),
                  child: const Icon(Icons.camera),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
