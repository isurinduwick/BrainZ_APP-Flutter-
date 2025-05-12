import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../screens/logoutpage.dart';
import 'parentsedit.dart';
import 'childprocess.dart';

class ParentSettings extends StatelessWidget {
  const ParentSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allow body to extend behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent to show gradient
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: AppTheme.gradientBackground,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 10), // Reduced top padding
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white70,
                  backgroundImage: const AssetImage('assets/profile.png'),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Anne",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Anne@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white54),
              const SettingsTile(title: "Add a Profile Picture"),
              SettingsTile(
                title: "Edit Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ParentEditScreen(),
                    ),
                  );
                },
              ),
              SettingsTile(
                title: "Check Child's Progress",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChildProgressScreen(),
                    ),
                  );
                },
              ),
              const SettingsTile(title: "Child's Account"),
              const SettingsTile(title: "Terms of Service"),
              SettingsTile(
                title: "Log Out",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogoutPage(),
                    ),
                  );
                },
              ),
              const SettingsTile(title: "Delete Account"),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SettingsTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: onTap,
    );
  }
}
