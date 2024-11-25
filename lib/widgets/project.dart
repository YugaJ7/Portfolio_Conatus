import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProject extends StatelessWidget {
  const MyProject({super.key});
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 700;
        final screenWidth = MediaQuery.of(context).size.width;
      return Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/back.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Projects",
                    style: TextStyle(
                      color: const Color(0xFFFD853A),
                      fontSize: isSmallScreen? screenWidth * 0.07:32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        project(image: 'assets/food.png'),
                        project(image: 'assets/quiz.png'),
                        project(image: 'assets/todo.png')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );}
    );
  }
}

class project extends StatelessWidget {
  final String image;
  const project({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50)
          ),
          height: 300,
          width: 300,
          child: Image.asset(image),
        ),
      ),
    );
  }
}