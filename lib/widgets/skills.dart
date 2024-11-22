import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 700;
        final screenWidth = MediaQuery.of(context).size.width;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF2F4F7),
            ),
            child: isSmallScreen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: screenWidth * 0.07,
                              color: const Color(0xFF344054),
                              fontFamily: 'SemiBold',
                            ),
                            children: const [
                              TextSpan(
                                text: 'My ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Skills',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFD853A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Lottie.asset(
                        'assets/yoga.json',
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        repeat: true,
                      ),
                      const SizedBox(height: 16),
                      LinearSkillsList(isSmallScreen: isSmallScreen),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Lottie.asset(
                            'assets/yoga.json',
                            repeat: true,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Color(0xFF344054),
                                      fontFamily: 'SemiBold',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'My ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'Skills',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFD853A),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              LinearSkillsList(isSmallScreen: isSmallScreen),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class LinearSkillsList extends StatelessWidget {
  final bool isSmallScreen;

  const LinearSkillsList({required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearSkillItem("Data Structure and Algorithm", 0.75, isSmallScreen),
        LinearSkillItem("Competitive Programming", 0.75, isSmallScreen),
        LinearSkillItem("Flutter", 0.9, isSmallScreen),
        LinearSkillItem("Java", 0.85, isSmallScreen),
        LinearSkillItem("Python", 0.85, isSmallScreen),
        LinearSkillItem("C/C++", 0.85, isSmallScreen),
      ],
    );
  }
}

class LinearSkillItem extends StatelessWidget {
  final String skillName;
  final double progress;
  final bool isSmallScreen;

  const LinearSkillItem(this.skillName, this.progress, this.isSmallScreen);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Adjusting container width based on screen size
    final containerWidth = isSmallScreen ? screenWidth * 0.8 : screenWidth * 0.5;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skillName,
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: containerWidth,
            child: LinearPercentIndicator(
              lineHeight: 8.0,
              percent: progress,
              backgroundColor: Colors.grey.shade300,
              progressColor: Colors.orange,
              barRadius: const Radius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
