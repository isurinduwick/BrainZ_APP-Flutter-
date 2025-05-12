import 'package:flutter/material.dart';
import 'package:brainz_app/utils/responsive_utils.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrainZ App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF76A3DC)),
        useMaterial3: true,
      ),
      home: const ResponsiveWrapper(
        child: SplashScreen(),
      ),
    );
  }
}
