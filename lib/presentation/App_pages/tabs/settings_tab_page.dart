import 'package:flutter/material.dart';

class SettingsTabPage extends StatelessWidget {
  const SettingsTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),

      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Change Password"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
