import 'package:flutter/material.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6E6F2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CircleAvatar(
              radius: 40, backgroundImage: AssetImage('assets/avatar.png')),
          SizedBox(height: 10),
          Center(child: Text("Johnny", style: TextStyle(fontSize: 20))),
          Center(child: Text("johnny@gmail.com")),
          Divider(),
          SettingsTile(title: "Add a Profile Picture"),
          SettingsTile(title: "Edit Profile"),
          SettingsTile(title: "Parent/Guardian Account"),
          SettingsTile(title: "Notifications"),
          SettingsTile(title: "Language"),
          SettingsTile(title: "Personalization"),
          SettingsTile(title: "Terms of Service"),
          SettingsTile(title: "Log Out"),
          SettingsTile(title: "Delete Account"),
        ],
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
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
