import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'emotion_PageOne.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'emotion_PageFinal.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EmotionPageTwo extends StatefulWidget {
  File video;

  EmotionPageTwo({Key key, this.video}) : super(key: key);

  @override
  MyEmotionPageTwo createState() => MyEmotionPageTwo(video);
}

Uri uri = Uri.parse('https://testing-l.herokuapp.com/emotion');

class MyEmotionPageTwo extends State<EmotionPageTwo> {
  File video;
  String emotionName;
  String soundName;
  double soundP;
  MyEmotionPageTwo(this.video);
  Dio dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
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
                            "assets/EmotionPage/dog.jpg",
                            height: 121.0,
                            width: 121.0,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 180.0),
                          child: Text(
                            "Emotion Detection",
                            style: TextStyle(fontSize: 30.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5FA),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
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
                'Upload an video of an dog using the "Upload" button below. Then, after a moment you will get the result.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5FA),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(6, 8), // changes position of shadow
                  ),
                ],
              ),
              height: 197.0,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  'assets/EmotionPage/dog.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            new Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(48, 0, 12, 0),
                width: 127.0,
                height: 47.0,
                child: MaterialButton(
                  child: Text(
                    'Upload',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Color(0xFFFFD500),
                  onPressed: () async {
                    // String filename = image.path.split('/').last;
                    Reference firebaseStorage = FirebaseStorage.instance
                        .ref()
                        .child('EmotionTemp/test.mp4');
                    await firebaseStorage.putFile(video);

                    final response = await http
                        .get('https://testing-l.herokuapp.com/emotion');

                    final decoded =
                        jsonDecode(response.body) as Map<String, dynamic>;

                    Reference ref = FirebaseStorage.instance.refFromURL(
                        'gs://test-3f1bf.appspot.com/EmotionTemp/test.mp4');
                    await ref.delete();

                    setState(() {
                      emotionName = decoded['emotionName'];
                      soundName = decoded['soundName'];
                      soundP = decoded['soundPercentage'];

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmotionPageFinal(
                                  video: video,
                                  name: emotionName,
                                  soundN: soundName,
                                  soundP: soundP)));
                    });
                  },
                ),
              ),
              Text("Or"),
              Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 42, 0),
                width: 135.0,
                height: 47.0,
                child: MaterialButton(
                  child: Text(
                    'Select again',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Color(0xFFFFD500),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmotionPageOne()));
                  },
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
