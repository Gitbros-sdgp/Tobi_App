import 'package:flutter/material.dart';

class Cross extends StatefulWidget {
  @override
  _CrossState createState() => _CrossState();
}

class _CrossState extends State<Cross> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('cross dog',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white))
          ])
        ],
      ),
    );
  }
}
