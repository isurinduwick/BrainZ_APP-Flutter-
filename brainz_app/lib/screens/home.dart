import 'package:brainz_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'profile_settings.dart';
import 'animals.dart';
// ignore: unused_import
import 'art/lotus_tower.dart';
// ignore: unused_import
import 'art/apple.dart';
import 'art/ready_to_play.dart';
import 'planetgo.dart';
import 'mathchallenge.dart';
import 'colourplay.dart'; // Add this import for the ColourPlayScreen
import 'dailyfunchallenge.dart'; // Add this import for the DailyFunChallengeScreen

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC),
      body: SafeArea(
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

                // Learning Paths Title
                const Text(
                  "Learning Paths",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 15),

                // Learning Paths Horizontal Slider
                SizedBox(
                  height: 180, // Fixed height for the horizontal scroll area
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // All categories now shown in a row
                        CategoryTile(
                          name: "Animals",
                          image: "assets/animal.png",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AnimalsScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 15),
                        CategoryTile(
                          name: "Language",
                          image: "assets/Language.png",
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Language coming soon')),
                            );
                          },
                        ),
                        const SizedBox(width: 15),
                        CategoryTile(
                          name: "Math",
                          image: "assets/Maths.png",
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Math coming soon')),
                            );
                          },
                        ),
                        const SizedBox(width: 15),
                        CategoryTile(
                          name: "Arts",
                          image: "assets/art.png",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ReadyToPlayScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 15),
                        CategoryTile(
                          name: "Science",
                          image: "assets/science.png",
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Science coming soon')),
                            );
                          },
                        ),
                        const SizedBox(width: 15),
                        CategoryTile(
                          name: "Colours",
                          image: "assets/colours.png",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ColourPlayScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
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
                        onPressed: () {
                          // Navigate to the Daily Fun Challenge screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DailyFunChallengeScreen(),
                            ),
                          );
                        },
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlanetGoScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ActivityCard(
                        title: "Math Challenge",
                        color: Colors.grey.shade300,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MathChallengeScreen(),
                            ),
                          );
                        },
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
          } else if (index == 0) {
            // Navigate to Home (refresh the Home screen)
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

class CategoryTile extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onPressed;

  const CategoryTile({
    super.key,
    required this.name,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 4,
        color: const Color(0xFF3D7DC9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          width: 140, // Fixed width for horizontal scrolling
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
