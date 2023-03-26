import 'package:flutter/material.dart';
import 'package:toiletbull/bird/coverscreen.dart';
import 'package:toiletbull/bird/homepage.dart';
import 'package:toiletbull/screens/welcome.dart';
import 'package:toiletbull/screens/map.dart';
import 'package:toiletbull/toilets/cmc.dart';
import 'package:toiletbull/toilets/enb.dart';
import 'package:toiletbull/toilets/eng.dart';
import 'package:toiletbull/bird/homepage.dart';

void main() => runApp(ToiletBull());

class ToiletBull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MapScreen.id: (context) => MapScreen(),
        CMC.id: (context) => CMC(),
        ENB.id: (context) => ENB(),
        ENG.id: (context) => ENG(),
        //game
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}