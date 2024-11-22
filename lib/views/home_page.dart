import 'package:flutter/material.dart';
import 'package:yuga_portfolio/widgets/about.dart';
import 'package:yuga_portfolio/widgets/education.dart';
import 'package:yuga_portfolio/widgets/profile_photo.dart';
import 'package:yuga_portfolio/widgets/contact.dart';
import 'package:yuga_portfolio/widgets/navbar.dart';
import 'package:yuga_portfolio/widgets/profile.dart';
import 'package:yuga_portfolio/widgets/services.dart';
import 'package:yuga_portfolio/widgets/skills.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Navbar(),
            const ProfilePhoto(),
            AboutSection(),
            EducationSection(),
            SkillsSection(),
            const MyProject(),
            const ProfileSection(),
            const FooterSection()
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF2F4F7),
      child: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Container(
          color: const Color(0xFFF2F4F7),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width*0.2, 
              backgroundImage: const AssetImage('assets/front.png'), 
            ),
          ),
        ),
          ListTile(
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
          ListTile(
            title: const Text("Education"),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
          ListTile(
            title: const Text("Skills"),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
          ListTile(
            title: const Text("Projects"),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
          ListTile(
            title: const Text("Contact"),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
        ],
      ),
    );
  }
}
