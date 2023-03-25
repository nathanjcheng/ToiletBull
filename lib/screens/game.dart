import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
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
    body: Container(
      margin: const EdgeInsets.all(0),
      color: Colors.blue,
      width: 390,
      height: 595,
    ),
  );
}