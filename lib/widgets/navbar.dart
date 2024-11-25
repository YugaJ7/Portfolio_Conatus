import 'package:flutter/material.dart';
import 'package:yuga_portfolio/widgets/responsive.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;
  final List<String> navItems = const [
    "Home",
    "About",
    "Education",
    "Skills",
    "Projects",
    "Profile",
    "Contact"
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      desktop: _buildDesktopNavbar(context),
    );
  }

  Widget _buildDesktopNavbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 60.0),
      child: Container(
        width: 770,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: navItems.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              return _buildNavbarItem(item, false, index);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildNavbarItem(String title, bool isActive, int index) {
  ValueNotifier<bool> isHovered = ValueNotifier<bool>(false);
  return MouseRegion(
    onEnter: (_) => isHovered.value = true,
    onExit: (_) => isHovered.value = false,
    child: ValueListenableBuilder<bool>(
      valueListenable: isHovered,
      builder: (context, hovering, child) {
        return GestureDetector(
          onTap: () => onNavItemTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: hovering ? const Color(0xFFFD853A) : Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    ),
  );
}
}
