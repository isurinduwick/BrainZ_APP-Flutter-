import 'package:brainz_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'profile_settings.dart';
import '../utils/app_theme.dart'; // Add this import

// Changed from StatelessWidget to StatefulWidget to manage state
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // State to track if learning paths are expanded
  bool _isLearningPathExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove backgroundColor and use a Container with gradient instead
      body: Container(
        decoration: AppTheme.gradientBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Section with settings
                  Row(
                    children: [
                      // Profile Image
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      const SizedBox(width: 10),
                      // User Name and Points
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Johnny",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                      // Settings Icon
                      IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.black54,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfileSettings(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Learning Paths Title - Now with tap functionality
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLearningPathExpanded = !_isLearningPathExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        const Text(
                          "Learning Paths",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                            _isLearningPathExpanded
                                ? Icons.arrow_circle_down
                                : Icons.arrow_circle_right,
                            size: 28),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Learning Paths Grid - Now conditionally showing items
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      // Always show Animals and Language
                      CategoryTile(
                        name: "Animals",
                        image: "assets/animal.png",
                      ),
                      CategoryTile(
                        name: "Language",
                        image: "assets/Language.png",
                      ),

                      // Only show these when expanded
                      if (_isLearningPathExpanded) ...[
                        CategoryTile(
                          name: "Math",
                          image: "assets/Maths.png",
                        ),
                        CategoryTile(
                          name: "Arts",
                          image: "assets/art.png",
                        ),
                        CategoryTile(
                          name: "Science",
                          image: "assets/science.png",
                        ),
                        CategoryTile(
                          name: "Colours",
                          image: "assets/colours.png",
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Quizzes & Activities Section
                  const Text(
                    "Quizzes & Activities",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Activities Row 1
                  Row(
                    children: [
                      Expanded(
                        child: ActivityCard(
                          title: "Daily Challenge",
                          color: Colors.pink,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ActivityCard(
                          title: "Language Lab",
                          color: Colors.grey.shade300,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Activities Row 2
                  Row(
                    children: [
                      Expanded(
                        child: ActivityCard(
                          title: "Planet Go",
                          color: Colors.grey.shade300,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ActivityCard(
                          title: "Math Challenge",
                          color: Colors.grey.shade300,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Collaborate with Friends
                  const Text(
                    "Collaborate with Friends",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Collaboration Buttons
                  Row(
                    children: [
                      Expanded(
                        child: CollaborationButton(
                          title: "Invite Friends",
                          color: Colors.blue,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CollaborationButton(
                          title: "Join",
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set to 0 for Home tab
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
        ],
        onTap: (index) {
          if (index == 1) {
            // Navigate to Dashboard
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Dashboard()),
            );
          }
        },
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String name;
  final String image;

  const CategoryTile({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xFF3D7DC9), // Blue card background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const ActivityCard({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Start",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollaborationButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const CollaborationButton({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color == Colors.white ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
