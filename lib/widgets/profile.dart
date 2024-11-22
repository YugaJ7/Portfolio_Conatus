import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}
class _ProfileSectionState extends State<ProfileSection> {
  late List<bool> hoverStates;
    final List<String> titles = [
    'Codeforces : stone_yuga7',
    'Codechef : stone7',
    'Leetcode : Stone_7',
  ];

  final List<String> images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  final List<String> urls = [
    'https://codeforces.com/profile/stone_yuga7',
    'https://www.codechef.com/users/stone7',
    'https://leetcode.com/u/Stone_7/',
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  void initState() {
    super.initState();
    hoverStates = List.generate(titles.length, (index) => false); 
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    return LayoutBuilder(
      builder: (context, constraints){
        bool isMobile = constraints.maxWidth <= 700;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( 
              "Let's have a look ",
              style: TextStyle(
                fontSize: isMobile?screenWidth*0.07:36,
                fontWeight: FontWeight.bold,
                fontFamily: 'SemiBold',
                color: Color(0xFF344054)
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: isMobile?screenWidth*0.07:36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SemiBold',
                ),
                children: const [
                  TextSpan(
                    text: 'at my ',
                    style: TextStyle(color: Color(0xFF344054)),
                  ),
                  TextSpan(
                    text: 'Portfolio',
                    style: TextStyle(color: Color(0xFFFD853A)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            screenWidth >= 1500
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(titles.length, (index) {
                      return _buildPortfolioCard(
                        titles[index],
                        images[index],
                        urls[index],
                        index,
                        isMobile
                      );
                    }),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(titles.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: _buildPortfolioCard(
                            titles[index],
                            images[index],
                            urls[index],
                            index,
                            isMobile
                          ),
                        );
                      }),
                    ),
                  ),
          ],
        ),
      );}
    );
  }
  Widget _buildPortfolioCard(String title, String image, String url, int index,bool isSmallScreen) {
    return MouseRegion(
      onEnter: (_) => setState(() => hoverStates[index] = true),
      onExit: (_) => setState(() => hoverStates[index] = false),
      child: AnimatedContainer(
        width: isSmallScreen?300:480,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        //transform: hoverStates[index] ? Matrix4.identity().translate(0.0,-10.0,0.0) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: hoverStates[index] ? const Color(0xFFFD853A).withOpacity(0.8) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFD853A).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => _launchURL(url),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          image,
                          width: isSmallScreen?280:480,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 8,
                      child: IconButton(
                        icon: hoverStates[index]? const ImageIcon(AssetImage('icon.png')):const ImageIcon(AssetImage('icon.png')),
                        iconSize: isSmallScreen?25:50,
                        onPressed: () {
                          _launchURL(url);
                        },
                        color: hoverStates[index]? const Color(0xFFFD853A):Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: hoverStates[index] ? Colors.white : Colors.grey,
                    fontSize: isSmallScreen?10:16,
                    fontFamily: 'SemiBold',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
