import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextField(
              obscureText: isPassword,
              decoration:
                  InputDecoration(fillColor: Colors.transparent, filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
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
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'SignUp',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createsignupButtonGoogle() {
    return Container(
      // color: Colors.orangeAccent,
      margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
      child: RaisedButton(
          // color: Colors.orangeAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
          color: Color.fromARGB(255, 255, 213, 0),
          onPressed: () {}, // action event fucntion
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/google.png',
                height: 40.0,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    "Sign in with Google",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          )),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("User Name"), //default false is password variabe
        _entryField("Email"),
        _entryField("Password", isPassword: true),
        _entryField("Confirm Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height; // app hight app widhth gannawa

    return Scaffold(
        body: Container(
      height: height, //scaffold aadesha karanawa ressponsive design
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .14),
                  // _title(),
                  //SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: height * .03),
                  _submitButton(),

                  SizedBox(height: height * .02),
                  _divider(),
                  SizedBox(height: height * .015),

                  _createsignupButtonGoogle(),
                  SizedBox(height: height * .055),
                  // _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
