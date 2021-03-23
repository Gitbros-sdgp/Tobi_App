import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart';

class Welcomepage extends StatefulWidget {
  //functions logics
  @override
  _WelcomepageState createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  //render grapics

  // Widget _title() {
  //   return Text(
  //     'Tobi',
  //     textAlign: TextAlign.center,
  //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  //   );
  // }
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 0)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignupPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Signup',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'T',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 64,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.black, fontSize: 64),
            ),
            TextSpan(
              text: 'b',
              style: TextStyle(color: Colors.black, fontSize: 64),
            ),
            TextSpan(
              text: 'i',
              style: TextStyle(color: Colors.black, fontSize: 64),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 255, 213, 0),
                  Color.fromARGB(255, 210, 175, 83)
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title(),
            SizedBox(
              height: 80,
            ),
            _submitButton(),
            SizedBox(
              height: 20,
            ),
            _signUpButton(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}
