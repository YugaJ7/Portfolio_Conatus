import 'package:flutter/material.dart';

class OverlayAnimatedGridElement extends StatefulWidget {
  OverlayAnimatedGridElement(this.imagepath);
  final String imagepath;

  @override
  _OverlayAnimatedGridElementState createState() =>
      _OverlayAnimatedGridElementState();
}

class _OverlayAnimatedGridElementState extends State<OverlayAnimatedGridElement>
    with TickerProviderStateMixin {
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  hoverActivation(hoverState) {
    setState(() {
      isHovered = hoverState;
    });
    print("activated -> " + hoverState.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50)
        ),
        height: MediaQuery.of(context).size.height,
        width: 300,
        child: Stack(
          children: [
            // Image.network(widget.imagepath),
            // Positioned(
            //     bottom: 0,
            //     right: 0,
            //     child: Image.asset(
            //         'arrow.png',
            //         scale: 1.5,
            //         //color: isPressed ? Colors.red : Colors.transparent, // Change color on press
            //       ),
            //   ),
            MouseRegion(
              onEnter: (event) {
                hoverActivation(true);
              },
              onExit: (event) {
                hoverActivation(false);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                child: isHovered?Image.asset(
                    widget.imagepath,
                    //scale: 1.5,
                    //color: isPressed ? Colors.red : Colors.transparent, // Change color on press
                  ):Image.asset(
                    'food.png',
                    //scale: 1.5,
                    //color: isPressed ? Colors.red : Colors.transparent, // Change color on press
                  ),
                //color: Color(0xFFFD853A).withOpacity(isHovered ? 0.1 : 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}