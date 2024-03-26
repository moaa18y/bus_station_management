import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: const <Widget>[
          UserHeader(name: 'Mohamed Mostafa', phoneNumber: '01xxxxxxxxx'),
          SettingsItem(icon: Icons.person, title: 'Personal information'),
          SettingsItem(icon: Icons.settings, title: 'Account Settings'),
          SettingsItem(icon: Icons.help, title: 'Help and support'),
          SettingsItem(icon: Icons.description, title: 'Terms & Conditions'),
          SettingsItem(icon: Icons.exit_to_app, title: 'Logout'),
          SocialMediaSection(),
          AppVersion(version: '1.1'),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class UserHeader extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const UserHeader({super.key, required this.name, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 30,
        child: Icon(Icons.person),
      ),
      title: Text(name),
      subtitle: Text(phoneNumber),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: Colors.blue,
      leading: Icon(icon),
      title: Text(title),
      textColor: Colors.blueGrey,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.facebook),
            onPressed: () {
              // Handle Facebook tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.facebook),
            onPressed: () {
              // Handle Instagram tap
            },
          ),
          IconButton(
            icon: const Icon(Icons.facebook),
            onPressed: () {
              // Handle WhatsApp tap
            },
          ),
        ],
      ),
    );
  }
}

class AppVersion extends StatelessWidget {
  final String version;

  const AppVersion({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('App Version: $version'),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'More',
        ),
      ],
    );
  }
}
