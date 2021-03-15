import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //child container for dog icon
                    child: Container(
                      //dog Icon
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/dog.jpg',
                          height: 77,
                          width: 77,
                        ),
                      ),
                      height: 100,
                      width: 100,
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
                          left: 20.0, top: 0.0, bottom: 150.0, right: 20),
                      padding: EdgeInsets.only(bottom: 0, right: 0),
                    ),
                    //end dog icon container
                    /* child:Container(child: Text(
                      "Emotion Detection",
                      style: GoogleFonts.lato(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),), */
                    

                    height: 300.0,
                    width: 392.0,
                    color: Color(0xffFFD500),
                    alignment: Alignment.bottomCenter,

                    margin: EdgeInsets.only(left: 0.0, top: 0.0),
                    padding: EdgeInsets.only(bottom: 0),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Colors.white),
                    /* margin: EdgeInsets.only(
                        left: 0.0, top: 0.0, bottom: 0.0, right: 0.0),
                    padding: EdgeInsets.only(
                        left: 150, top: 100, bottom: 453, right: 242), */
                  ),
                  Container(
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
                        left: 20.0, top: 20.0, bottom: 0.0, right: 20),
                    padding: EdgeInsets.only(bottom: 310, right: 352),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 160, top: 14.0, bottom: 0.0),

                    padding: EdgeInsets.all(0.0),
                    // color: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/notRecord.jpeg'),
                      iconSize: 50,
                    ),
                    //color: Colors.white,
                  )
                ],
              ),
              Row(
                children: [
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

                    margin: EdgeInsets.only(left: 130, top: 0.0, bottom: 0.0),
                    padding: EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 10),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
/* Container(
                     decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                        left: 20.0, top: 20.0, bottom: 0.0, right: 20),
                    padding: EdgeInsets.only(bottom: 310, right: 352),
                  ), */
