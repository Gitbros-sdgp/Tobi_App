import 'package:flutter/material.dart';

class Abusedog extends StatefulWidget {
  //user seen only complains
  @override
  _AbusedogState createState() => _AbusedogState();
}

class _AbusedogState extends State<Abusedog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('abuse dog',
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
