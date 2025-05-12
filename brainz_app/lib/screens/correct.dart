import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class CorrectScreen extends StatefulWidget {
  final String userName;
  final String userImage;
  final VoidCallback onContinue;

  const CorrectScreen({
    super.key,
    this.userName = "Johnny",
    this.userImage = "assets/profile.png",
    required this.onContinue,
  });

  @override
  State<CorrectScreen> createState() => _CorrectScreenState();
}

class _CorrectScreenState extends State<CorrectScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 5),
    );
    // Start the confetti animation when screen loads
    _confettiController.play();

    // Auto-continue after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      widget.onContinue();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76A3DC), // Blue background
      body: Stack(
        children: [
          // Confetti effect
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              gravity: 0.1,
              colors: const [
                Colors.green,
                Colors.yellow,
                Colors.pink,
                Colors.orange,
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // User name
                Text(
                  widget.userName,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // User image in circle
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    image: DecorationImage(
                      image: AssetImage(widget.userImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // Correct text
                const Text(
                  "CORRECT!!!",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF39FF14), // Bright green
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
