import 'package:flutter/material.dart';
import 'profile_settings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6E6F2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text("Learning Paths"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfileSettings()));
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(12),
        children: const [
          CategoryTile(name: "Animals"),
          CategoryTile(name: "Language"),
          CategoryTile(name: "Math"),
          CategoryTile(name: "Arts"),
          CategoryTile(name: "Science"),
          CategoryTile(name: "Colours"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String name;

  const CategoryTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(name, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
