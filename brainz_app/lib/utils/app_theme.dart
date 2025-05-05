import 'package:flutter/material.dart';

class AppTheme {
  static const BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF76A3DC), // Light blue at top (0%)
        Color(0xFF76A3DC), // Medium blue at 7%
        Color(0xFF3F5776), // Dark blue at 100%
      ],
      stops: [0.0, 0.07, 1.0],
    ),
  );
}
