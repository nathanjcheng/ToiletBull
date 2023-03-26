import 'package:flutter/material.dart';
Color textColor = Colors.white;

class SettingScreen extends StatelessWidget {

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
      color: Colors.grey,
      width: 390,
      height: 595,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(60)),
          Image.asset('images/dog.png',
            height: 220,
          ),
          Text("THIS DOES NOTHING LOL",
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold,
                fontSize: 20),),
          SwitchExample(),
        ],
      ),
    ),
  );
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.green,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

