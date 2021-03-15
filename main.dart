import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final WelComeText welComeText;
  //yApp(this.welComeText);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Welcom',
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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

                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
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
                ])
            
          ])),
    );
  }
}

