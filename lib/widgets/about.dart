import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 700;
        final screenWidth = MediaQuery.of(context).size.width;
        return Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Container(
            decoration: BoxDecoration(
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
                            style: TextStyle(fontSize: screenWidth*0.07, color: Color(0xFF344054), fontFamily: 'SemiBold'),
                            children: [
                              TextSpan(
                                text: 'Why ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Hire me?',
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
                        'assets/coder.json', 
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        repeat: true,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'I am an aspiring computer professional pursuing a Bachelor of Technology in Computer Science Engineering (Data Science) at Ajay Kumar Garg Engineering College. Known for being studious, curious, and a strong team player, I possesses skills in programming languages like Python, C++, and Java, as well as expertise in Data Structures and Algorithms. With a keen interest in applying technical insights to practical challenges, I is driven to excel in the field of computer science.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '5+',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Project Completed',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Project In Progress',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: const Color.fromARGB(156, 0, 0, 0)),
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xFFFD853A),
                          elevation: 0,
                        ),
                        child: Text(
                          'Hire me',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Regular'
                          ),
                        ),
                      ),
                      SizedBox(height: 20,)
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
                            'assets/coder.json', 
                            // height: MediaQuery.of(context).size.height*.5,
                            // width: MediaQuery.of(context).size.width*.5,
                            repeat: true,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 32, color: Color(0xFF344054), fontFamily: 'SemiBold'),
                                  children: [
                                    TextSpan(
                                      text: 'Why ',
                                    ),
                                    TextSpan(
                                      text: 'Hire me?',
                                      style: TextStyle(
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'I am an aspiring computer professional pursuing a Bachelor of Technology in Computer Science Engineering (Data Science) at Ajay Kumar Garg Engineering College. Known for being studious, curious, and a strong team player, I possesses skills in programming languages like Python, C++, and Java, as well as expertise in Data Structures and Algorithms. With a keen interest in applying technical insights to practical challenges, I is driven to excel in the field of computer science.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '5+',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Project Completed',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 32),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Project Completed',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: const Color.fromARGB(156, 0, 0, 0)),
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xFFFD853A),
                          elevation: 0,
                        ),
                        child: Text(
                          'Hire me',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Regular'
                          ),
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  )
                  )
                ],
                    ),
                ),
          ),
        );
      },
    );
  }
}
