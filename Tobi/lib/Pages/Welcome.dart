import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Option.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Welcom',
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: MyWelcomePage(),
    );
  }
}

class MyWelcomePage extends StatefulWidget {
  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<MyWelcomePage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (context, animation, animationTime, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                alignment: Alignment.centerRight,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return OptionPage();
            }),
      );
    });
    return Scaffold(
        backgroundColor: Color(0xffFDD610),
        body: Column(children: <Widget>[
          Row(
            //ROW 1
            children: [
              Container(
                //color: Colors.white,

                child: Text(
                  "T",
                  style: GoogleFonts.lato(fontSize: 150),
                ),

                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                margin: EdgeInsets.only(left: 120, top: 100.0, bottom: 0.0),
                padding: EdgeInsets.all(40.0),
              ),
            ],
          ),
          Row(
              //         //ROW 2
              children: [
                Container(
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.lato(fontSize: 40),
                  ),
                  margin: EdgeInsets.only(left: 120),
                  padding: EdgeInsets.only(top: 0),
                ),
              ]),
          // timing(context),
        ]));
  }
}
