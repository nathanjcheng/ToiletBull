import 'package:flutter/material.dart';
import 'package:toiletbull/toiletButton.dart';
import 'package:toiletbull/screens/welcome.dart';
import 'package:toiletbull/toilets/cmc.dart';
import 'package:toiletbull/toilets/eng.dart';
import 'package:toiletbull/toilets/enb.dart';

class MappyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      title: const Text('ToiletBull',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 40,
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromRGBO(0, 104, 72, 1.0),
    ),
    body: Stack(
        children: <Widget>[
        Container(
          height: double.infinity,
          color: Colors.red,
          child: Image.asset('images/themap.png',
            fit: BoxFit.fitHeight
          ),
        ),
        Container(
          margin:
          EdgeInsets.only(left:180, top: 292,),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 4,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
          ),
          ), //THE GPS POINTER
          ToiletButton(x:76, y:143, //ENG
              onTap: () {
              Navigator.pushNamed(context, WelcomeScreen.id);
            }),
          ToiletButton(x:188, y:110, //CMC
              onTap: () {
                Navigator.pushNamed(context, CMC.id);
            }),
          ToiletButton(x:102, y:330, //ENB
              onTap: () {
                Navigator.pushNamed(context, ENB.id);
            }),
        ],
    ),
  );
}

