import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tt/pages/login.dart';
import 'package:tt/pages/terms_conditions.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});
  final String userName = 'Mohamed';
  final String userMobileNumber = '123-456-7890';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'User Profile',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const UserHeader(
            userName: 'Mohamed',
            userMobileNumber: '123-456-7890',
          ), // Custom widget for user information and avatar
          ProfileOption(
            icon: Icons.person,
            title: 'Personal Information',
            onTap: () => navigateTo(context, const PersonalInfoPage()),
          ),
          // ProfileOption(
          //   icon: Icons.settings,
          //   title: 'Account Settings',
          //   onTap: () => navigateTo(context, AccountSettingsPage()),
          // ),
          // ProfileOption(
          //   icon: Icons.account_balance_wallet,
          //   title: 'App Wallet',
          //   onTap: () => navigateTo(context, AppWalletPage()),
          // ),
          // ProfileOption(
          //   icon: Icons.card_giftcard,
          //   title: 'Gift Points',
          //   onTap: () => navigateTo(context, GiftPointsPage()),
          // ),
          // ProfileOption(
          //   icon: Icons.support_agent,
          //   title: 'Help and Support',
          //   onTap: () => navigateTo(context, HelpSupportPage()),
          // ),
          ProfileOption(
            icon: Icons.description,
            title: 'Terms and Conditions',
            onTap: () => navigateTo(context, const TermsAndConditionsPage()),
          ),
          ProfileOption(
            icon: Icons.exit_to_app,
            title: 'Logout',
            onTap: () => handleLogout(context),
          ),
          const ContactUs(), // Custom widget for contacting on WhatsApp
        ],
      ),
    );
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void handleLogout(BuildContext context) {
    // Handle user logout logic
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
}

class UserHeader extends StatelessWidget {
  final String userName;
  final String userMobileNumber;

  const UserHeader(
      {super.key, required this.userName, required this.userMobileNumber});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Row(
        children: <Widget>[
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person_sharp),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userName,
                  style: const TextStyle(color: Colors.black),
                ), // Display the user's name
                Text(
                  userMobileNumber,
                  style: const TextStyle(color: Colors.black),
                ), // Display the user's mobile number
              ],
            ),
          ),
        ],
      ),
      accountEmail: const Text(''), // Hide the email field
      decoration: BoxDecoration(
        color: Colors.grey.shade300, // Set the background color for the header
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}

void sendWhatsapp(String phoneNo) {
  String url = "whatsapp://send?phone=$phoneNo";
  launchUrl(Uri.parse(url));
}

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
      title: const Text('Contact Us on WhatsApp'),
      onTap: () {
        sendWhatsapp('add your mobile number');
      },
    );
  }
}

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
      ),
      body: const Center(
        child: Text('Personal information details go here.'),
      ),
    );
  }
}
