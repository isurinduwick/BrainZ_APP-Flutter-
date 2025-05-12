import 'package:flutter/material.dart';
import 'package:brainz_app/screens/home.dart';
import 'package:brainz_app/screens/dashboard.dart';
import 'package:brainz_app/screens/predictors_quizz.dart';

class TigerQuizScreen extends StatefulWidget {
  const TigerQuizScreen({super.key});

  @override
  State<TigerQuizScreen> createState() => _TigerQuizScreenState();
}

class _TigerQuizScreenState extends State<TigerQuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool answered = false;
  int? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'How much legs does tiger have?',
      'image': 'assets/tigerimg.png',
      'options': [3, 1, 4, 6],
      'correctAnswer': 4
    },
    // Add more tiger questions here
  ];

  void checkAnswer(int selectedOption) {
    if (answered) return;

    setState(() {
      selectedAnswer = selectedOption;
      answered = true;

      if (selectedOption == questions[currentQuestionIndex]['correctAnswer']) {
        score++;
      }
    });

    // Move to next question after a delay
    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          answered = false;
          selectedAnswer = null;
        });
      } else {
        // Quiz completed - show results or navigate back
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Quiz Completed!'),
            content: Text('Your score: $score/${questions.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const PredictorsQuizzScreen()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC), // Light blue background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
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
                      const Spacer(),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Question display
                  Center(
                    child: Image.asset(
                      currentQuestion['image'],
                      height: 200,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Question text
                  Center(
                    child: Text(
                      currentQuestion['question'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Answer options
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2.0,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: List.generate(
                        currentQuestion['options'].length,
                        (index) {
                          final option = currentQuestion['options'][index];
                          final isSelected = selectedAnswer == option;
                          final isCorrect =
                              option == currentQuestion['correctAnswer'];

                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: answered
                                  ? (isCorrect
                                      ? Colors.green
                                      : (isSelected
                                          ? Colors.red
                                          : const Color(0xFF3A4A5C)))
                                  : const Color(0xFF3A4A5C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(8),
                            ),
                            onPressed: () => checkAnswer(option),
                            child: Text(
                              option.toString(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
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
}
