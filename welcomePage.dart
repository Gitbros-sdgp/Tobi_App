import 'package:Tobi/src/SignupPage.dart';
import 'package:Tobi/src/loginPage.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'SignupPage.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  //render graphics, thrge eke tynw
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //rendr grphcs
  Widget _submitButton() {
    // submit button
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
                  spreadRadius: 2)
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
            //page link krnn
            context,
            MaterialPageRoute(builder: (context) => SignupPage()));
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
          'Sign up',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // Widget _label() {
  //   return Container(
  //       margin: EdgeInsets.only(top: 40, bottom: 20),
  //       child: Column(
  //         children: <Widget>[
  //           Text(
  //             'Quick login with Touch ID',
  //             style: TextStyle(color: Colors.white, fontSize: 17),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Icon(Icons.fingerprint, size: 90, color: Colors.white),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Text(
  //             'Touch ID',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 15,
  //               decoration: TextDecoration.underline,
  //             ),
  //           ),
  //         ],
  //       ));
  // }

  Widget _title() {
    return RichText(
      // thsrge txt,ek anuw text dana wdh wens wenw

      textAlign: TextAlign.center,
      text: TextSpan(
          //title name d , ev ,rnz wdhta
          text: 'T',
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.display1,
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
              text: 'bi.',
              style: TextStyle(color: Colors.black, fontSize: 64),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    //main widget ek ,me page ekm stateful widget ekk,amthra wdget 4k tynw ,ewa build ekt pitin tynne,(overidre ekn uda)
    //mulinma build wena widget eka
    return Scaffold(
      //meka athule sampurna okkoma buttns lbls imges  okkom dana container ek,
      body: SingleChildScrollView(
        //google krpn
        child: Container(
          // me child ek container ekt, childs wdhta ek ekpart bedann pulwn , me child ek login and regster boxes wlt
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
                    Color.fromARGB(255, 255, 213, 0), //thw gradint ekk ennone
                    Color.fromARGB(255, 255, 175, 83)
                    // Color(0xfffbb448),
                    // Color(0xffe46b10)
                  ])), //liner fradient eke colurs welcome eke
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .center, // column meka title ekatai buttn dektai - word wlt
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
              ),
              //_label()
            ],
          ),
        ),
      ),
    );
  }
}
