import 'package:flutter/material.dart';
import 'dashboard.dart';

class ChildSignUp extends StatelessWidget {
  const ChildSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB7D2F0),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("WELCOME!", style: TextStyle(fontSize: 24)),
            TextField(
                decoration: const InputDecoration(labelText: 'User Name')),
            TextField(decoration: const InputDecoration(labelText: 'Email')),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const Dashboard()));
              },
              child: const Text("Sign-Up"),
            ),
          ],
        ),
      ),
    );
  }
}
