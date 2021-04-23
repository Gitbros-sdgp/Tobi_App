import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Breed_PageOne.dart';
import 'Breed_PageFinal.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BreedPageTwo extends StatefulWidget {
  File image;

  BreedPageTwo({Key key, this.image}) : super(key: key);

  @override
  MyBreedPageTwo createState() => MyBreedPageTwo(image);
}

Uri uri = Uri.parse('https://testing-l.herokuapp.com/breed');

// Future<http.Response> _getBreed(File image) {
//   // final String apiUrl = 'https://testing-l.herokuapp.com/breed';

//   // return http.post(
//   //   Uri.https('testing-l.herokuapp.com', 'breed'),
//   //   headers: <String, String>{
//   //     'Content-Type': 'application/json; charset=UTF-8',
//   //   },
//   //   body: jsonEncode(
//   //     <String, File>{'_breedImg': image},
//   //   ),
//   // );

//   final mimeTypeDate = lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');

//   final imageRequest = http.MultipartFile('POST', uri);

//   final imageUpload = http.MultipartFile.fromPath('_breedImg', image.path, contentType: MediaType(mimeTypeDate[0], mimeTypeDate[1]));
// }

class MyBreedPageTwo extends State<BreedPageTwo> {
  File image;
  String breedName;
  MyBreedPageTwo(this.image);
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
                'Upload an image of an dog using the "Upload" button below. Then, after a moment you will get the result.',
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
                child: Image.file(image),
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
                        .child('BreedTemp/test.jpg');
                    await firebaseStorage.putFile(image);

                    final response =
                        await http.get('https://testing-l.herokuapp.com/breed');

                    final decoded =
                        jsonDecode(response.body) as Map<String, dynamic>;

                    Reference ref = FirebaseStorage.instance.refFromURL(
                        'gs://test-3f1bf.appspot.com/BreedTemp/test.jpg');
                    await ref.delete();

                    setState(() {
                      breedName = decoded['BreedName'];

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BreedPageFinal(
                                  image: image, name: breedName)));
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
                            builder: (context) => BreedPageOne()));
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
