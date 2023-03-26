import 'package:flutter/material.dart';
import 'map.dart';
import 'dart:math' as math;

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: AnimatedBuilder(
                      animation: _controller,
                        builder: (_, child) {
                          return Transform.rotate(angle: _controller.value * 2* math.pi,
                          child: child,);
                        },
                        child: Image.asset('images/bulltoilet.png')),
                    height: 90,
                  ),
                ),//(ICON)
                const Text(
                'ToiletBull',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40,
                ),),//(TITLE)
              ],
            ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          color: Color.fromRGBO(0, 104, 72, 1.0),
          borderRadius: BorderRadius.circular(30.0),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            onPressed: () {
              Navigator.pushNamed(context, MapScreen.id);
            },
            height: 42.0,
            child: Text(
              "Let's Go!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      )//(LETS GO BUTTON)
          ],
        ),
      ),
    );
  }
}

