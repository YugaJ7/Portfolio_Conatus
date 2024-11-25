import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
  
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
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Color(0xFF1D1D1D),
          ),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's Connect Here",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Medium'
                ),
              ),
              const SizedBox(height: 25),
              const Divider(color: Colors.grey),
              const SizedBox(height: 25),

              if (isMobile)
                ..._buildFooterContentMobile()
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildFooterContentDesktop(),
                ),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),

              Text(
                "Copyright© 2024 Yuga Jaiswal. All Rights Reserved",
                style: GoogleFonts.montserrat( textStyle: TextStyle(color: Colors.white, fontSize: 14),)
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildFooterContentDesktop() {
    return [
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFFD853A),
                  radius: 20,
                  child: Text(
                    "YJ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "YUGA JAISWAL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Medium',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "I believe great things happen when people collaborate, and I’m always excited to meet new people. Whether you're interested in working together on a project, have a question, or just want to share ideas, feel free to reach out.",
              style: TextStyle(color: Colors.grey,fontFamily: 'Regular'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(icon: const ImageIcon(AssetImage('assets/facebook.png')), color: Colors.white, onPressed: () {_launchURL('https://www.facebook.com/login/');},),
                IconButton(icon: const ImageIcon(AssetImage('assets/instagram.png')), color: Colors.white, onPressed: () {_launchURL('https://www.instagram.com/yuga.j7/');},),
                IconButton(icon: const ImageIcon(AssetImage('assets/x.png')), color: Colors.white, onPressed: () {_launchURL('https://x.com/yugaj7');},),
                IconButton(icon: const ImageIcon(AssetImage('assets/mail.png')), color: Colors.white, onPressed: () {_launchURL('https://workspace.google.com/intl/en-US/gmail/');},),
              ],
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Navigation",
            style: TextStyle(
              color: Color(0xFFFD853A),
              fontSize: 16,
              fontFamily: 'SemiBold'
            ),
          ),
          const SizedBox(height: 10),
          _footerLink("Home"),
          _footerLink("About Us"),
          _footerLink("Education"),
          _footerLink("Skills"),
          _footerLink("Projects"),
          _footerLink("Profile"),
        ],
      ),
      SizedBox(width: 30,),
      const Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact",
              style: TextStyle(
                color: Color(0xFFFD853A),
                fontSize: 16,
                fontFamily: 'SemiBold'
              ),
            ),
            SizedBox(height: 10),
            Text("+91 8090822729",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(height: 10),
            Text("jaiswal.yuga7@gmail.com",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get the latest information",
              style: TextStyle(
                color: Color(0xFFFD853A),
                fontSize: 16,
                fontFamily: 'SemiBold',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      hintStyle: const TextStyle(color: Colors.black, fontFamily: 'Regular'),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFD853A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildFooterContentMobile() {
  return [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFFFD853A),
              radius: 20,
              child: Text(
                "YJ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              "YUGA JAISWAL",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Medium',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "I believe great things happen when people collaborate, and I’m always excited to meet new people. Whether you're interested in working together on a project, have a question, or just want to share ideas, feel free to reach out.",
          style: TextStyle(color: Colors.grey, fontFamily: 'Regular'),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10, 
          children: [
            IconButton(
              icon: const ImageIcon(AssetImage('assets/facebook.png')),
              color: Colors.white,
              onPressed: () {
                _launchURL('https://www.facebook.com/login/');
              },
            ),
            IconButton(
              icon: const ImageIcon(AssetImage('assets/instagram.png')),
              color: Colors.white,
              onPressed: () {
                _launchURL('https://www.instagram.com/yuga.j7/');
              },
            ),
            IconButton(
              icon: const ImageIcon(AssetImage('assets/x.png')),
              color: Colors.white,
              onPressed: () {
                _launchURL('https://x.com/yugaj7');
              },
            ),
            IconButton(
              icon: const ImageIcon(AssetImage('assets/mail.png')),
              color: Colors.white,
              onPressed: () {
                _launchURL('https://workspace.google.com/intl/en-US/gmail/');
              },
            ),
          ],
        ),
      ],
    ),
    const SizedBox(height: 20),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Navigation",
          style: TextStyle(
              color: Color(0xFFFD853A),
              fontSize: 16,
              fontFamily: 'SemiBold'),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _footerLink("Home"),
            const SizedBox(width: 10),
            _footerLink("About Us"),
            const SizedBox(width: 10),
            _footerLink("Service"),
            const SizedBox(width: 10),
            _footerLink("Resume"),
            const SizedBox(width: 10),
            _footerLink("Project"),
          ],
        ),
      ],
    ),
    const SizedBox(height: 15),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contact",
          style: TextStyle(
            color: Color(0xFFFD853A),
            fontSize: 16,
            fontFamily: 'SemiBold',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "+91 8090822729",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "jaiswal.yuga7@gmail.com",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    const SizedBox(height: 10),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Get the latest information",
          style: TextStyle(
            color: Color(0xFFFD853A),
            fontSize: 16,
            fontFamily: 'SemiBold',
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Email Address",
                  hintStyle: const TextStyle(
                      color: Colors.black, fontFamily: 'Regular'),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFD853A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ),
  ];
}


  Widget _footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
