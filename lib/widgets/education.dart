import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class EducationSection extends StatelessWidget {
  
  final List<String> places = [
    'City Montessori School, Lucknow',
    'City Montessori School, Lucknow',
    'Ajay Kumar Garg Engineering College, Ghaziabad',
  ];

  final List<String> score = [
    'High School(X-2021) | ICSE - 95.5%',
    'Secondary School(X-2021) | ISC - 91.0%',
    'Pursuing 2nd year B.Tech. in CSE(DS)',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: screenWidth>700?screenWidth * 0.03:32, 
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SemiBold',
                ),
                children: const [
                  TextSpan(
                    text: 'My ',
                    style: TextStyle(color: Color(0xFF344054)),
                  ),
                  TextSpan(
                    text: 'Education',
                    style: TextStyle(color: Color(0xFFFD853A)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            FixedTimeline.tileBuilder(
              builder: TimelineTileBuilder.connected(
                contentsAlign: screenWidth >= 660
                    ? ContentsAlign.alternating
                    : ContentsAlign.basic,
                itemCount: places.length,
                contentsBuilder: (context, index) => _buildTimelineItem(
                  context,
                  places[index],
                  score[index],
                  isLast: index == places.length - 1,
                ),
                indicatorBuilder: (context, index) => DotIndicator(
                  color: places[index] ==
                          'Ajay Kumar Garg Engineering College, Ghaziabad'
                      ? Colors.orange
                      : Colors.black,
                ),
                connectorBuilder: (context, index, isLast) =>
                    SolidLineConnector(color: Colors.grey.shade400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    String place,
    String score, {
    bool isLast = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place,
            style: TextStyle(
              fontSize: screenWidth>700?screenWidth * 0.02:18, // Adjust for responsiveness
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            score,
            style: TextStyle(
              fontSize: screenWidth>700?screenWidth * 0.01:14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
