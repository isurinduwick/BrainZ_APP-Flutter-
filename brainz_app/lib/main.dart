import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const BrainzApp());

class BrainzApp extends StatelessWidget {
  const BrainzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brainz!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}
