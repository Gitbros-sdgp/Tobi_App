import 'package:flutter/material.dart';

class Lossdog extends StatefulWidget {
  @override
  _LossdogState createState() => _LossdogState();
}

class _LossdogState extends State<Lossdog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('loss dog',
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
