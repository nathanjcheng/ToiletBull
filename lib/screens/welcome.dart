import 'package:flutter/material.dart';
import 'map.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

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
                    child: Image.asset('images/bulltoilet.png'),
                    height: 80,
                  ),
                ),//(ICON)
                const Text(
                'ToiletBull',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50,
                ),),//(TITLE)
              ],
            ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          color: Colors.green,
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

