import 'package:flutter/material.dart';

class MyCoverScreen extends StatelessWidget {
  final bool gameHasStarted;
  static const String id = 'cover';

  MyCoverScreen({required this.gameHasStarted});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, -0.5),
      child: Text(
        textAlign: TextAlign.center,
        gameHasStarted ? '' : 'Learn some interesting bathroom facts!                                          TAP TO PLAY!',
        style: TextStyle(color: Colors.white, fontSize: 30,
        fontWeight: FontWeight.bold),
      ),
    );
  }
}
