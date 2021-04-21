import 'package:Tobi/Pages/iotMap.dart';
import 'package:Tobi/Pages/noticeboard.dart';
import 'package:Tobi/Pages/qrScanner.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Breed_PageOne.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MyHomePage extends StatefulWidget {
  User user;
  MyHomePage({Key key, this.user}) : super(key: key);

  @override
  _homePageState createState() => _homePageState(user);
}

Future<Widget> _getImage(BuildContext context, String imageName) async {
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(
      value.toString(),
      height: 50.0,
      width: 50.0,
      fit: BoxFit.scaleDown,
    );
  });
  return image;
}

class _homePageState extends State<MyHomePage> {
  User user;
  String name = "User";
  User currentUser = FirebaseAuth.instance.currentUser;

  _homePageState(this.user);

  void checkDeviceId(String uid) {
    FirebaseFirestore.instance
        .collection('gps_devices')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        String tempdid = documentSnapshot.data()['deviceId'];
        // print(tempdid);
        if (tempdid != "" && tempdid.length == 6) {
          // did = tempdid;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => IotMap(tempdid)));
        }
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QRScanner(uid)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _uid;
    _uid = '${widget.user.uid}';

    String profilePicName = _uid + "_User.jpg";

    Stream<DocumentSnapshot> provideDocumentFieldStream() {
      return FirebaseFirestore.instance
          .collection('UserData')
          .doc(_uid)
          .snapshots();
    }

    return Scaffold(
      backgroundColor: Color(0xFFF5F5FA),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // The side menu button and the profile pic
              new Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6.0,
                      ),
                      child: new Container(
                        alignment: Alignment.topLeft,
                        height: 50.0,
                        width: 50.0,
                        child:
                            new Image.asset('assets/homePage/sideMenuIcon.jpg'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 146.0,
                        right: 10.0,
                      ),
                      child: new Container(
                        alignment: Alignment.topRight,
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(50.0),
                          color: Color(0xFFF5F5FA),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFAAAACC),
                              blurRadius: 8,
                              offset: Offset(6, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(50.0),
                          child: FutureBuilder(
                            future: _getImage(context, profilePicName),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Container(
                                  child: snapshot.data,
                                );
                              }

                              return Container();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // The welcome title with the users name
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 130.0,
                      top: 43.0,
                    ),
                    child: StreamBuilder<DocumentSnapshot>(
                        stream: provideDocumentFieldStream(),
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasData) {
                            Map<String, dynamic> documentFields =
                                snapshot.data.data();

                            name = documentFields['fName'];
                            currentUser.updateProfile(displayName: name);

                            return new Text(
                              "Welcome back, " + name,
                              style: new TextStyle(
                                  fontSize: 30.0, fontFamily: 'Actor'),
                            );
                          }
                        }),
                  ),
                ],
              ),
              // The breed and emotion buttons
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 21.0,
                        bottom: 21.0,
                      ),
                      child: InkWell(
                        child: new Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new Container(
                              alignment: Alignment.center,
                              height: 160.0,
                              width: 152.0,
                              decoration: new BoxDecoration(
                                color: Color(0xFFF5F5FA),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFAAAACC),
                                    blurRadius: 10.0,
                                    offset: Offset(6, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  bottom: 30.0,
                                ),
                                child: new Image.asset(
                                  'assets/homePage/breedIcon.jpg',
                                  height: 95.0,
                                  width: 98.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 100.0,
                              ),
                              child: new Container(
                                alignment: Alignment.center,
                                height: 24.0,
                                width: 60.0,
                                child: new Text(
                                  'Breed',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Actor',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBreedPageOne()));
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 21.0,
                        bottom: 21.0,
                      ),
                      child: new Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          new Container(
                            alignment: Alignment.center,
                            height: 160.0,
                            width: 152.0,
                            decoration: new BoxDecoration(
                              color: Color(0xFFF5F5FA),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFAAAACC),
                                  blurRadius: 10,
                                  offset: Offset(6, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                bottom: 30.0,
                              ),
                              child: new Image.asset(
                                'assets/homePage/emotionIcon.jpg',
                                height: 95.0,
                                width: 98.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 100.0,
                            ),
                            child: new Container(
                              alignment: Alignment.center,
                              height: 24.0,
                              width: 90.0,
                              child: new Text(
                                'Emotion',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Actor',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // The noriceboard and social media buttons
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 21.0,
                        top: 13.0,
                        bottom: 210.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          checkDeviceId(widget.user.uid);
                        },
                        child: new Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new Container(
                              alignment: Alignment.center,
                              height: 160.0,
                              width: 152.0,
                              decoration: new BoxDecoration(
                                color: Color(0xFFF5F5FA),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFAAAACC),
                                    blurRadius: 10,
                                    offset: Offset(6, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  bottom: 30.0,
                                ),
                                child: new Image.asset(
                                  'assets/homePage/mapIcon.png',
                                  height: 62.1,
                                  width: 85.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 100.0,
                              ),
                              child: new Container(
                                alignment: Alignment.center,
                                height: 24.0,
                                width: 130.0,
                                child: new Text(
                                  'GPS Collars',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Actor',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 21.0,
                        top: 13.0,
                        bottom: 210.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoticeBoard()));
                        },
                        child: new Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new Container(
                              alignment: Alignment.center,
                              height: 160.0,
                              width: 152.0,
                              decoration: new BoxDecoration(
                                color: Color(0xFFF5F5FA),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFAAAACC),
                                    blurRadius: 10,
                                    offset: Offset(6, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  bottom: 30.0,
                                ),
                                child: new Image.asset(
                                  'assets/homePage/noticeIcon.png',
                                  height: 59.02,
                                  width: 127.15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 100.0,
                              ),
                              child: new Container(
                                alignment: Alignment.center,
                                height: 24.0,
                                width: 150.0,
                                child: new Text(
                                  'Noticeboard',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Actor',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
