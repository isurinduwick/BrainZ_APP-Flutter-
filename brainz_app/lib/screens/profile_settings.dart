import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

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
      ),
      body: Container(
        decoration: AppTheme.gradientBackground,
        child: SafeArea(  // Add SafeArea to prevent content from going under status bar
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 10),  // Reduced top padding
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Johnny",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "johnny@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white54),
              const SettingsTile(title: "Add a Profile Picture"),
              const SettingsTile(title: "Edit Profile"),
              const SettingsTile(title: "Parent/Guardian Account"),
              const SettingsTile(title: "Notifications"),
              const SettingsTile(title: "Language"),
              const SettingsTile(title: "Personalization"),
              const SettingsTile(title: "Terms of Service"),
              const SettingsTile(title: "Log Out"),
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

  const SettingsTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
    );
  }
}
