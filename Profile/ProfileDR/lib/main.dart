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
          child: Stack(
            children: <Widget>[
              Container(
                height: 300.0,
                width: 392.0,
                color: Color(0xffFFD500),
                alignment: Alignment.bottomCenter,

                margin: EdgeInsets.only(left: 0.0, top: 0.0, bottom: 502),
                //padding: EdgeInsets.only(bottom: 0),
                //
              ),
              Container(
                child: Text(
                  "Find Your Pet",
                  style: GoogleFonts.lato(
                      fontSize: 30, fontWeight: FontWeight.bold,color: Color(0xffFFFFFF)),
                ),
                margin: EdgeInsets.only(
                    left: 0.0, top: 200.0, bottom: 0.0, right: 0.0),
                padding: EdgeInsets.only(bottom: 0, right: 0),
              ),
              Container(
                child: Text(
                  "Doctor",
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xffFFFFFF)),
                ),
                margin: EdgeInsets.only(
                    left: 0.0, top: 230.0, bottom: 0.0, right: 0.0),
                padding: EdgeInsets.only(bottom: 0, right: 0),
              ),

              //search doctors
              Container(
                height: 70.0,
                width: 374.0,
                //color: Color(0xffFFD500),
                alignment: Alignment.bottomCenter,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a Doctor Name'),
                ),
                margin: EdgeInsets.only(
                    left: 9.0, top: 290.0, bottom: 0.0, right: 0.0),
              ),
              Container(
                child:
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){

                  }
                  
                  ,
                ),
                 margin: EdgeInsets.only(
                    left: 330.0, top: 310.0, bottom: 0.0, right: 0.0),
              ),

              Container(
                child: Text(
                  "Top Rated Doctor",
                  style: GoogleFonts.lato(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(
                    left: 80.0, top: 370.0, bottom: 0.0, right: 0.0),
                padding: EdgeInsets.only(bottom: 0, right: 0),
              ),
              //show doctors in this container
              /* Container(
                height: 360.0,
                width: 392.0,
                color: Color(0xffF5F5F5),
                alignment: Alignment.bottomCenter,

                margin: EdgeInsets.only(left: 10.0, top: 430.0, bottom: 0,right: 10),
                //padding: EdgeInsets.only(bottom: 0,left: 10,right: 10),
                //
              ), */
              Container(
                width: 350,
                height: 355,
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
                    left: 20.0, top: 430.0, bottom: 10.0, right: 10),
               // padding: EdgeInsets.only(bottom: 310, right: 352),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
