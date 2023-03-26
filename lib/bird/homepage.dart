import 'dart:async';
import 'barrier.dart';
import 'bird.dart';
import 'coverscreen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  static const String id = 'gameHome';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var intValue;

  List <String> facts = [
    "The first modern toilet prototype was built by a poet",
    "Half the world population don't have access to safe toilets",
    "A toilet uses almost seven gallons of water each time it is flushed.",
    "Only 80% of people wash their hands after the toilet. EW!",
    "Only 5% of people wash their hands for a minimum of 15 seconds",
  ];



  Random random = new Random();
  // bird variables
  static double birdY = 0;
  double initialPos = birdY;
  double height = 0;
  double time = 0;
  double gravity = -3.9; // how strong the gravity is
  double velocity = 2.4; // how strong the jump is
  double birdWidth = 0.1; // out of 2, 2 being the entire width of the screen
  double birdHeight = 0.1; // out of 2, 2 being the entire height of the screen

  // game settings
  bool gameHasStarted = false;

  // barrier variables
  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.5; // out of 2
  List<List<double>> barrierHeight = [
    // out of 2, where 2 is the entire height of the screen
    // [topHeight, bottomHeight]
    [0.6, 0.4],
    [0.4, 0.6],
  ];

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // a real physical jump is the same as an upside down parabola
      // so this is a simple quadratic equation
      height = gravity * time * time + velocity * time;

      setState(() {
        birdY = initialPos - height;
      });

      // check if bird is dead
      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }

      // keep the map moving (move barriers)
      moveMap();

      // keep the time going!
      time += 0.01;
    });
  }

  void moveMap() {
    for (int i = 0; i < barrierX.length; i++) {
      // keep barriers moving
      setState(() {
        barrierX[i] -= 0.005;
      });

      // if barrier exits the left part of the screen, keep it looping
      if (barrierX[i] < -1.5) {
        barrierX[i] += 3;
      }
    }
  }

  void resetGame() {
    Navigator.pop(context); // dismisses the alert dialog
    setState(() {
      birdY = 0;
      gameHasStarted = false;
      time = 0;
      initialPos = birdY;
      barrierX = [2, 2 + 1.5];
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.green,
            title: Center(
              child: Text(
                facts[intValue],
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    color: Colors.white,
                    child: Text(
                      'PLAY AGAIN',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPos = birdY;
    });
  }

  bool birdIsDead() {
    setState(() {
      intValue = random.nextInt(5)+0;
    });
    // check if the bird is hitting the top or the bottom of the screen
    if (birdY < -1 || birdY > 1) {
      return true;
    }

    // hits barriers
    // checks if bird is within x coordinates and y coordinates of barriers
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          barrierX[i] + barrierWidth >= -birdWidth &&
          (birdY <= -1 + barrierHeight[i][0] ||
              birdY + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Stack(
                    children: [
                      // bird
                      MyBird(
                        birdY: birdY,
                        birdWidth: birdWidth,
                        birdHeight: birdHeight,
                      ),

                      // tap to play
                      MyCoverScreen(gameHasStarted: gameHasStarted),

                      // Builder(
                      //   builder: (BuildContext context) {
                      //     for (int i = 0; i < barrierX.length; i++) {
                      //       for (int ) {
                      //         return MyBarrier(
                      //         barrierX: barrierX[i],
                      //         barrierWidth: barrierWidth,
                      //         barrierHeight: barrierHeight[i][0],
                      //         isThisBottomBarrier: false,
                      //       );
                      //       }
                      //     }
                      //     return Container();
                      //   },
                      // ),

                      // Top barrier 0
                      MyBarrier(
                        barrierX: barrierX[0],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[0][0],
                        isThisBottomBarrier: false,
                      ),

                      // Bottom barrier 0
                      MyBarrier(
                        barrierX: barrierX[0],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[0][1],
                        isThisBottomBarrier: true,
                      ),

                      // Top barrier 1
                      MyBarrier(
                        barrierX: barrierX[1],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[1][0],
                        isThisBottomBarrier: false,
                      ),

                      // Bottom barrier 1
                      MyBarrier(
                        barrierX: barrierX[1],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[1][1],
                        isThisBottomBarrier: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
