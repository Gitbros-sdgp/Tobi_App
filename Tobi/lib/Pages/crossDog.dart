import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CrossdogPage extends StatefulWidget {
  @override
  _CrossdogPageState createState() => _CrossdogPageState();
}

class _CrossdogPageState extends State<CrossdogPage> {
  User currentUser = FirebaseAuth.instance.currentUser;

  TextEditingController locationController = new TextEditingController();
  TextEditingController ageContoller = new TextEditingController();
  TextEditingController breedController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  ScrollController scrollController = new ScrollController();

  CollectionReference complains =
      FirebaseFirestore.instance.collection('Crossdogs');

  Future<void> submitData(String uid, String displayName) {
    return complains
        .add({
          'uid': uid,
          'displayName': displayName,
          'breed': breedController.text, //forminapp
          'location': locationController.text,
          'mobile': mobileController.text,
          'age': ageContoller.text
        })
        .then((value) => print("Submited"))
        .catchError((error) => print("Failed to Submit: $error"));
  }

  File imageFile;

  void openCamera() async {
    var temImg = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = temImg;
    });
  }

  void openGallery() async {
    var temImg = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = temImg;
    });
  }

  Widget showImage(double h) {
    if (imageFile == null) {
      print("no image selected");
      return Text("No Image Selected !");
    } else {
      print("image selected");
      scrollController.jumpTo(h);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(
            imageFile,
            height: 400,
            width: 400,
          ),
          Text(
            "Image Selected",
            style: TextStyle(color: Colors.green),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    Firebase.initializeApp();
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: mq.size.height / 8,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 20),
                child: Text(
                  " Did you want to \"Cross your dog\" ? \n\n Then Fill the form.",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
                child: TextField(
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  controller: breedController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange[900],
                      ),
                    ),
                    labelText: "Breed",
                    hintText: "Huskey / Bulldog",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
                child: TextField(
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  controller: locationController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange[900],
                      ),
                    ),
                    labelText: "Location",
                    hintText: "Nearest Location",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
                child: TextField(
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  controller: mobileController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange[900],
                      ),
                    ),
                    labelText: "mobile",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  controller: ageContoller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange[600],
                      ),
                    ),
                    labelText: "Age",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 50, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add a image : ",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        tooltip: "Open Camera",
                        onPressed: () {
                          openCamera();
                        },
                        splashColor: Color.fromARGB(255, 255, 175, 83),
                        hoverColor: Color.fromARGB(255, 255, 175, 83),
                        icon: Icon(Icons.camera_alt_sharp),
                        iconSize: 40,
                      ),
                      IconButton(
                        onPressed: () {
                          openGallery();
                        },
                        tooltip: "Open Gallery",
                        splashColor: Color.fromARGB(255, 255, 175, 83),
                        hoverColor: Color.fromARGB(255, 255, 175, 83),
                        icon: Icon(Icons.filter),
                        iconSize: 40,
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: showImage(mq.size.height),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 255, 175, 83),
                  child: MaterialButton(
                    minWidth: mq.size.width / 2,
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      submitData(currentUser.uid, currentUser.displayName);
                      FocusScope.of(context).unfocus();
                      locationController.clear();
                      breedController.clear();
                      mobileController.clear();
                      ageContoller.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: mq.size.height / 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
