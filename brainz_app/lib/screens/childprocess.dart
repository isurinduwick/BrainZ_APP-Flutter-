import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChildProgressScreen extends StatelessWidget {
  // Sample data for the child's progress
  final Map<String, double> performanceScores = {
    'Math': 80.0,
    'English': 85.0,
  };

  final List<String> recommendations = [
    'New Science Module',
    'Brain teasers',
  ];

  final bool isPremiumUser = false;

  // ignore: use_super_parameters
  ChildProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90CAF9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildPerformanceMetrics(context),
              const SizedBox(height: 20),
              _buildPreferencesAndRecommendations(),
              const SizedBox(height: 20),
              _buildOfflineAccess(),
              Spacer(),
              _buildDashboardButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Child's Progress",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.settings, size: 30),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPerformanceMetrics(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF1976D2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Performance Metrics",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildMathCard()),
              const SizedBox(width: 10),
              Expanded(child: _buildEnglishCard()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMathCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Math",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Score : ${performanceScores['Math']?.toInt()}%",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          // ignore: sized_box_for_whitespace
          Container(
            height: 100,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 100,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: true),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 25,
                        color: Colors.grey.shade300,
                        width: 15,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 70,
                        color: Colors.blue.shade300,
                        width: 15,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 80,
                        color: Colors.blue.shade500,
                        width: 15,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnglishCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "English",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Score : ${performanceScores['English']?.toInt()}%",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          // ignore: sized_box_for_whitespace
          Container(
            height: 100,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 40),
                      FlSpot(1, 50),
                      FlSpot(2, 45),
                      FlSpot(3, 60),
                      FlSpot(4, 55),
                      FlSpot(5, 85),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 30),
                      FlSpot(1, 40),
                      FlSpot(2, 20),
                      FlSpot(3, 45),
                      FlSpot(4, 35),
                      FlSpot(5, 55),
                    ],
                    isCurved: true,
                    color: Colors.grey,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesAndRecommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Preferences & Recommendations",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF1976D2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Based on recent activities we recommend:",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              for (String recommendation in recommendations)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      recommendation.contains('Science')
                          ? const Icon(Icons.science, color: Colors.white)
                          : const Icon(Icons.psychology, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        recommendation,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOfflineAccess() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Offline Access",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset('assets/crown.png', height: 25),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Premium users can access all features offline. Upgrade now to enjoy uninterrupted learning!",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1976D2),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text("Upgrade"),
              ),
              Image.asset('assets/character.png', height: 60),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardButton() {
    return Center(
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xFF455A64),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// Main widget to launch the app
// ignore: use_key_in_widget_constructors
class ChildProgressApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChildProgressScreen(),
    );
  }
}

void main() {
  runApp(ChildProgressApp());
}
