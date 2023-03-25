import 'package:flutter/material.dart';
import 'game.dart';
import 'settings.dart';
import 'mappy.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'map_screen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int currentIndex = 1;

  final screens = [
    GameScreen(),
    MappyScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        iconSize: 40,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Game',
            backgroundColor: Color.fromRGBO(0, 104, 72, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
            backgroundColor: Color.fromRGBO(0, 104, 72, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color.fromRGBO(0, 104, 72, 1.0),
          ),
        ],
      ),
    );
  }
}
