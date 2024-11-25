import 'package:flutter/material.dart';
import 'package:yuga_portfolio/widgets/about.dart';
import 'package:yuga_portfolio/widgets/education.dart';
import 'package:yuga_portfolio/widgets/profile_photo.dart';
import 'package:yuga_portfolio/widgets/contact.dart';
import 'package:yuga_portfolio/widgets/navbar.dart';
import 'package:yuga_portfolio/widgets/profile.dart';
import 'package:yuga_portfolio/widgets/project.dart';
import 'package:yuga_portfolio/widgets/skills.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for sections
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _profileKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Scroll to a specific section
  void _scrollToSection(GlobalKey key) {
    final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero, ancestor: null).dy;
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        controller: _scrollController, 
        child: Column(
          children: [
            Navbar(
              onNavItemTap: (index) {
                switch (index) {
                  case 0:
                    _scrollToSection(_homeKey);
                    break;
                  case 1:
                    _scrollToSection(_aboutKey);
                    break;
                  case 2:
                    _scrollToSection(_educationKey);
                    break;
                  case 3:
                    _scrollToSection(_skillsKey);
                    break;
                  case 4:
                    _scrollToSection(_projectsKey);
                    break;
                  case 5:
                    _scrollToSection(_profileKey);
                    break;
                  case 6:
                    _scrollToSection(_contactKey);
                    break;
                }
              },
            ),
            Container(key: _homeKey, child: const ProfilePhoto()),
            Container(key: _aboutKey, child: AboutSection()),
            Container(key: _educationKey, child: EducationSection()),
            Container(key: _skillsKey, child: SkillsSection()),
            Container(key: _projectsKey, child: const MyProject()),
            Container(key: _profileKey, child: const ProfileSection()),
            Container(key: _contactKey, child: const FooterSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF2F4F7),
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            color: const Color(0xFFF2F4F7),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.2,
                backgroundImage: const AssetImage('assets/front.png'),
              ),
            ),
          ),
          ListTile(
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_aboutKey);
            },
          ),
          ListTile(
            title: const Text("Education"),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_educationKey);
            },
          ),
          ListTile(
            title: const Text("Skills"),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_skillsKey);
            },
          ),
          ListTile(
            title: const Text("Projects"),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_projectsKey);
            },
          ),
          ListTile(
            title: const Text("Contact"),
            onTap: () {
              Navigator.pop(context);
              _scrollToSection(_contactKey);
            },
          ),
        ],
      ),
    );
  }
}
