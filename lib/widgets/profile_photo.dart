import 'package:flutter/material.dart';
import 'package:yuga_portfolio/widgets/responsive.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _buildMobileView(context),
      desktop: _buildDesktopView(context),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return _buildAnimatedSection(context);
  }

  Widget _buildDesktopView(BuildContext context) {
    return _buildAnimatedSection(context);
  }

  Widget _buildAnimatedSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Column(

        mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'title.png',
            //width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'profile.png',

          ),
        ],
      ),
    );
  }
}
