import 'package:flutter/material.dart';
import 'dart:math';

class ColourMatcherScreen extends StatefulWidget {
  const ColourMatcherScreen({super.key});

  @override
  State<ColourMatcherScreen> createState() => _ColourMatcherScreenState();
}

class _ColourMatcherScreenState extends State<ColourMatcherScreen> {
  String currentColourName = "Red";
  int score = 0;
  bool showFeedback = false;
  bool isCorrect = false;
  final Random random = Random();

  // List of colors and their names
  final Map<String, Color> colorMap = {
    "Red": Colors.red,
    "Green": Colors.green,
    "Black": Colors.black,
    "Yellow": Colors.yellow,
    "Pink": Colors.pink,
    "Purple": Colors.purple,
    "Brown": Colors.brown,
  };

  late List<String> colorOptions;

  @override
  void initState() {
    super.initState();
    _generateNewQuestion();
  }

  void _generateNewQuestion() {
    // Select a random color name
    List<String> colorNames = colorMap.keys.toList();
    currentColourName = colorNames[random.nextInt(colorNames.length)];

    // Create a list of 4 unique color options including the correct one
    colorOptions = [currentColourName];
    while (colorOptions.length < 4) {
      String randomColor = colorNames[random.nextInt(colorNames.length)];
      if (!colorOptions.contains(randomColor)) {
        colorOptions.add(randomColor);
      }
    }

    // Shuffle options so correct answer isn't always in the same position
    colorOptions.shuffle();
  }

  void _checkAnswer(String selectedColor) {
    setState(() {
      showFeedback = true;
      isCorrect = selectedColor == currentColourName;

      if (isCorrect) {
        score += 10;
      }

      // Reset after a delay
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          setState(() {
            showFeedback = false;
            _generateNewQuestion();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              Row(
                children: [
                  // Profile Image
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(width: 10),
                  // Name and Points
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
                          Text(
                            "$score",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
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
                      // Navigate to settings
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Colours",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Color name display
              Center(
                child: Stack(
                  children: [
                    // Outline layer
                    Text(
                      currentColourName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.black,
                        fontFamily: 'Comic Sans MS',
                      ),
                    ),
                    // Fill layer
                    Text(
                      currentColourName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Comic Sans MS',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Color options in a 2x2 grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: colorOptions.map((colorName) {
                    return GestureDetector(
                      onTap: () {
                        if (!showFeedback) {
                          _checkAnswer(colorName);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorMap[colorName],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: showFeedback &&
                                  colorName == currentColourName
                              ? [
                                  BoxShadow(
                                    color:
                                        isCorrect ? Colors.green : Colors.red,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  )
                                ]
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Feedback message
              if (showFeedback)
                Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      isCorrect ? "Correct!" : "Try again!",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
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
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
