import 'package:flutter/material.dart';
import 'package:toiletbull/screens/map.dart';

class ENB extends StatefulWidget {
  static const String id = 'ENB';
  @override
  _ENB createState() => _ENB();
}

class _ENB extends State<ENB> with SingleTickerProviderStateMixin {

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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/toilet.png'),
                      height: 60,
                    ),
                  ),//(ICON)
                  const Text(
                    ' at ENB',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 50,
                    ),),//(TOILET TITLE)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 9.0),
              child: Image.asset('images/ENB.png',
                height: 270,
              ),
            ),
            Container(
                height: 270,
                child:Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,
                        width: 4),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reviews',
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 23),),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 12.0),
                            padding: const EdgeInsets.all(5.0),
                            width: 400,
                            height:65,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 1.5, color: Colors.black),
                                bottom: BorderSide(width: 1.5, color: Colors.black),
                              ),
                            ),
                            child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Denny gives a  ★★★',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20),),
                                Text('"Clean but tissues everywhere!"',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 14),),
                              ],
                            ),  //BOB REVIEW

                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12.0),
                            padding: const EdgeInsets.all(5.0),
                            width: 400,
                            height:65,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.5, color: Colors.black),
                              ),
                            ),
                            child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bob gives a  ★★',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20),),
                                Text('"Did someone cry in here?',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 14),),
                              ],
                            ),  //BOB REVIEW

                          ),
                        ],
                      )

                    ],
                  ),

                )
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '⭐  ⭐  ⭐  ⭐',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40,
                  ),),//(TOILET TITLE)
              ],
            ),*/ //THIS IS THE OLD STAR ROW
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Material(
                color: Colors.black,
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
                    "Back to map!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            )//(Back to map button!)
          ],
        ),
      ),
    );
  }
}

