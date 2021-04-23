import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'Home.dart';

class BreedPageFinal extends StatefulWidget {
  File image;
  String name;

  BreedPageFinal({Key key, this.image, this.name}) : super(key: key);

  @override
  MyBreedPageFinal createState() => MyBreedPageFinal(image, name);
}

class MyBreedPageFinal extends State<BreedPageFinal> {
  File image;
  String name;
  User user = FirebaseAuth.instance.currentUser;

  MyBreedPageFinal(this.image, this.name);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFF5F5FA),
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(color: Color(0xFFFFD500)),
                      height: 256.0,
                      width: 410.0,
                      child: new Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: new BorderRadius.circular(100.0),
                            child: new Image.asset(
                              "assets/BreedPageTwo/dog2.png",
                              height: 121.0,
                              width: 121.0,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 180.0),
                            child: Text(
                              "Breed Detection",
                              style: TextStyle(fontSize: 30.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                    ),
                    child: new Container(
                      height: 400.0,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5FA),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFAAAACC),
                            blurRadius: 10.0,
                            offset: Offset(6, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.file(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                    ),
                    child: new Text(
                      name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Actor',
                      ),
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Material(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFFD500),
                          shape: CircleBorder(),
                        ),
                        child: new IconButton(
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage(
                                            user: user,
                                          )));
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
