import 'package:flutter/material.dart';
import 'package:toiletbull/screens/welcome.dart';

class ToiletButton extends StatelessWidget {
  ToiletButton({this.x = 100, this.y = 100, required this.onTap});

  final double x;
  final double y;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Container(
        margin:
        EdgeInsets.only(left:x, top: y,),
        width: 45,
        height: 45,
        color: Colors.black,
        child: Image.asset('images/toilet.png',
        ),
    ),
      );
  }
}