import 'package:flutter/material.dart';
// Remove fl_chart import and use a custom pie chart implementation
import 'profile_settings.dart';
import 'dart:math' as math;
import 'home.dart'; // Add import for home screen

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF76A3DC), // New blue color from hex 76A3DC
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile section
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
                          children: const [
                            Text(
                              "10",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.amber, size: 18),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Settings icon
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

                // Chart section in a card
                Card(
                  elevation: 4,
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          "February",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 200,
                          // Replace PieChart with custom implementation
                          child: CustomPieChart(
                            sections: [
                              PieChartSectionData(
                                value: 25,
                                title: '25%',
                                color: Colors.red,
                              ),
                              PieChartSectionData(
                                value: 38,
                                title: '38%',
                                color: Colors.yellow,
                              ),
                              PieChartSectionData(
                                value: 18,
                                title: '18%',
                                color: Colors.purple,
                              ),
                              PieChartSectionData(
                                value: 8,
                                title: '8%',
                                color: Colors.blue,
                              ),
                              PieChartSectionData(
                                value: 7,
                                title: '7%',
                                color: Colors.green,
                              ),
                              PieChartSectionData(
                                value: 4,
                                title: '4%',
                                color: Colors.red[900]!,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Legend
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildLegendItem(Colors.red, "Math"),
                            _buildLegendItem(Colors.yellow, "Shapes"),
                            _buildLegendItem(Colors.purple, "Science"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildLegendItem(Colors.blue, "Colours"),
                            _buildLegendItem(Colors.green, "Planets"),
                            _buildLegendItem(Colors.red[900]!, "English"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Rewards section
                const Text(
                  "Rewards",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 100,
                  color: const Color(
                      0xFF5D99C6), // Darker blue as shown in the image
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildRewardItem(Icons.shield, "5 Badges"),
                      _buildRewardItem(Icons.star, "10 Stars"),
                      _buildRewardItem(Icons.emoji_events, "1 Trophy"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Collaborations section
                Row(
                  children: [
                    const Text(
                      "Collaborations",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.arrow_circle_right, size: 30),
                      onPressed: () {
                        // Navigate to collaborations detail screen
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCollaborationItem(
                          'Team SpongeBob', 'assets/teamspongbob.png'),
                      _buildCollaborationItem('Greg', 'assets/greg.png'),
                      _buildCollaborationItem('Nita', 'assets/nita.png'),
                      _buildCollaborationItem('Sunny', 'assets/sun.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Setting to 1 to highlight Dashboard tab
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
        ],
        onTap: (index) {
          if (index == 0) {
            // Navigate to Home using direct navigation instead of named route
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          }
        },
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }

  Widget _buildRewardItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.amber, size: 36),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildCollaborationItem(String name, String imagePath) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Custom simple pie chart implementation
class CustomPieChart extends StatelessWidget {
  final List<PieChartSectionData> sections;

  const CustomPieChart({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = math.min(constraints.maxWidth, constraints.maxHeight);
      return Center(
        child: SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: PieChartPainter(sections),
            child: Center(
              child: Container(
                width: size * 0.4,
                height: size * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Progress',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class PieChartPainter extends CustomPainter {
  final List<PieChartSectionData> sections;

  PieChartPainter(this.sections);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    double totalValue = sections.fold(0, (sum, section) => sum + section.value);
    double startAngle = -math.pi / 2; // Start from top (12 o'clock position)

    for (var section in sections) {
      final sweepAngle = 2 * math.pi * (section.value / totalValue);
      final paint = Paint()
        ..color = section.color
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      // Calculate position for the percentage label
      final double labelAngle = startAngle + sweepAngle / 2;
      final double labelRadius = radius * 0.7;
      final double x = center.dx + labelRadius * math.cos(labelAngle);
      final double y = center.dy + labelRadius * math.sin(labelAngle);

      // Draw percentage text
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: section.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PieChartSectionData {
  final double value;
  final String title;
  final Color color;

  PieChartSectionData({
    required this.value,
    required this.title,
    required this.color,
  });
}
