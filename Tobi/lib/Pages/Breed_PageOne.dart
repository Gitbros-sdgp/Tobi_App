import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Breed_PageTwo.dart';

class BreedPageOne extends StatefulWidget {
  @override
  MyBreedPageOne createState() => MyBreedPageOne();
}

class MyBreedPageOne extends State<BreedPageOne> {
  File _image;

  void _getImageG() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _getImageC() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFF5F5FA),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
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
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Container(
                      width: 350.0,
                      margin: const EdgeInsets.all(30),
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5FA),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(6, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 175.0,
                      child: Text(
                        'Select an image from your phone or open your camera and take a photo. Then upload the photo.',
                        style: TextStyle(fontSize: 18.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                ),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.fromLTRB(48, 0, 12, 0),
                      width: 127.0,
                      height: 47.0,
                      child: MaterialButton(
                        child: Text(
                          'Select from device',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Color(0xFFFFD500),
                        onPressed: () {
                          _getImageG();
                        },
                      ),
                    ),
                    new Text("or"),
                    new Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 42, 0),
                      width: 140.0,
                      height: 47.0,
                      child: MaterialButton(
                        child: Text(
                          'Open Camera',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Color(0xFFFFD500),
                        onPressed: () {
                          _getImageC();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                    ),
                    child: new Container(
                      margin: const EdgeInsets.fromLTRB(48, 0, 12, 0),
                      width: 127.0,
                      height: 47.0,
                      child: MaterialButton(
                        child: Text(
                          'Upload',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Color(0xFFFFD500),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BreedPageTwo(image: _image)));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
