import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 0.5,
            width: MediaQuery.of(context).size.width / 0.5,
            child: Stack(
              children: <Widget>[
                //  Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //children: [

                Container(
                  //child container for dog icon
                  child: Container(
                    //dog Icon
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/EmotionPage/dog.jpg',
                        height: 115,
                        width: 115,
                      ),
                    ),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF5F5FA),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFAAAACC),
                          blurRadius: 8,
                          offset: Offset(6, 4),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                        left: 20.0, top: 37.0, bottom: 90.0, right: 20),
                    padding: EdgeInsets.only(bottom: 0, right: 0),
                  ),
                  //end dog icon container

                  height: 300.0,
                  width: 392.0,
                  color: Color(0xffFFD500),
                  alignment: Alignment.bottomCenter,

                  margin: EdgeInsets.only(left: 0.0, top: 0.0),
                  padding: EdgeInsets.only(bottom: 0),
                ),
                Container(
                  child: Text(
                    "Emotion Detection",
                    style: GoogleFonts.lato(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(
                      left: 70.0, top: 250.0, bottom: 0.0, right: 20),
                  padding: EdgeInsets.only(bottom: 0, right: 0),
                ),
                //   ],
                //),
                //  Row(
                //  children: [
                /* Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.white),
                      margin: EdgeInsets.only(
                          left: 0.0, top: 400.0, bottom: 70.0, right: 0.0),
                      padding: EdgeInsets.only(
                          left: 0, top: 0, bottom: 0, right: 0),
                    ), */
                Container(
                  width: 350,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffF0F0F0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFAAAACC),
                        blurRadius: 8,
                        offset: Offset(6, 4),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                      left: 20.0, top: 340.0, bottom: 0.0, right: 20),
                  padding: EdgeInsets.only(bottom: 310, right: 352),
                ),
                //   ],
                //   ),
                //    Row(
                //  children: [
                Container(
                  margin: EdgeInsets.only(left: 160, top: 650.0, bottom: 0.0),

                  padding: EdgeInsets.all(0.0),
                  // color: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/EmotionPage/notRecord.jpeg'),
                    iconSize: 50,
                  ),
                  //color: Colors.white,
                )
                //   ],
                //   ),
                //  Row(
                // children: [
                ,
                Container(
                  width: 130.0,
                  height: 70.0,
                  //color: Colors.yellow,

                  child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Upload",
                        style: GoogleFonts.lato(fontSize: 20),
                      ),
                      color: Color(0xffFFD500),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),

                  margin: EdgeInsets.only(left: 130, top: 700.0, bottom: 0.0),
                  padding:
                      EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
                )
                //   ],
                //   )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
