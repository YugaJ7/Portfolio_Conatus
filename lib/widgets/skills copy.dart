import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth <= 700;
        final screen = MediaQuery.of(context).size.width;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 233, 233, 234),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: isMobile ? screen * 0.07 : 36,
                        color: const Color(0xFF344054),
                        fontFamily: 'SemiBold',
                      ),
                      children: [
                        const TextSpan(
                          text: 'My ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                          text: 'Skills',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  isMobile
                      ? Column(
                          children: [
                            SkillsGrid(isMobile: isMobile),
                            const SizedBox(height: 16),
                            LinearSkillsList(isMobile: isMobile),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: SkillsGrid(isMobile: isMobile)),
                            const SizedBox(width: 16),
                            Expanded(child: LinearSkillsList(isMobile: isMobile)),
                          ],
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

class SkillsGrid extends StatelessWidget {
  final bool isMobile;

  SkillsGrid({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:  3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        final skills = [
          ["Dart/Flutter", 0.9],
          ["Java", 0.9],
          ["HTML/CSS", 0.95],
          ["JavaScript", 0.7],
          ["Python", 0.6],
          ["C/C++", 0.9],
        ];
        return CircularSkillItem(
          skills[index][0] as String,
          skills[index][1] as double,
          isMobile,
        );
      },
    );
  }
}

class CircularSkillItem extends StatelessWidget {
  final String skillName;
  final double progress;
  final bool isMobile;

  CircularSkillItem(this.skillName, this.progress, this.isMobile);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.width;

    final containerSize = screen * 0.15;
    final circleRadius = containerSize * 0.3;
    final textSize = containerSize * 0.1;

    return SizedBox(
      width: containerSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: isMobile ? circleRadius * 2 : circleRadius,
            lineWidth: containerSize * 0.05,
            percent: progress,
            center: Text(
              "${(progress * 100).toInt()}%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isMobile ? textSize * 2 : textSize,
                color: Colors.black,
              ),
            ),
            progressColor: Colors.orange,
            backgroundColor: Colors.grey.shade300,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            skillName,
            style: TextStyle(
              fontSize: isMobile ? textSize * 2 : textSize,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LinearSkillsList extends StatelessWidget {
  final bool isMobile;

  LinearSkillsList({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearSkillItem("Data Structure and Algorithm", 0.75, isMobile),
        LinearSkillItem("Competitive Programming", 0.75, isMobile),
        LinearSkillItem("VS Code", 0.9, isMobile),
        LinearSkillItem("Figma/Canva", 0.85, isMobile),
      ],
    );
  }
}

class LinearSkillItem extends StatelessWidget {
  final String skillName;
  final double progress;
  final bool isMobile;

  LinearSkillItem(this.skillName, this.progress, this.isMobile);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.width;
    final containerSize = screen * 0.15;
    final textSize = containerSize * 0.1;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skillName,
            style: TextStyle(
              fontSize: isMobile ? textSize * 2 : textSize,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          LinearPercentIndicator(
            lineHeight: 8.0,
            percent: progress,
            backgroundColor: Colors.grey.shade300,
            progressColor: Colors.orange,
            barRadius: const Radius.circular(4),
          ),
        ],
      ),
    );
  }
}
