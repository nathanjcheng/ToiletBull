import 'package:flutter/material.dart';
import 'package:toiletbull/screens/welcome.dart';
import 'package:toiletbull/screens/map.dart';

void main() => runApp(ToiletBull());

class ToiletBull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MapScreen.id: (context) => MapScreen(),
        //InfoScreen.id: (context) => InfoScreen(),
      },
    );
  }
}