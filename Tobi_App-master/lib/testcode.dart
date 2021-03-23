import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TestingDatabase extends StatefulWidget {
  @override
  _TestingDatabaseState createState() => _TestingDatabaseState();
}

class _TestingDatabaseState extends State<TestingDatabase> {
  String deviceId = "gps001";
  String dateTime = "2021-03-21 11:54:19";
  String lat = "5.952892800";
  String lng = "80.600426000";

  final databaseRef =
      FirebaseDatabase.instance.reference(); //database reference object

  final textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    databaseRef.child("gpsdata").child(deviceId).onValue.listen((event) {
      var snapshot = event.snapshot;
      setState(() {
        // print(
        //     'dateTime : ${snapshot.value['dateTime']}, lat : ${snapshot.value['lat']}, lng : ${snapshot.value['lng']}');
        // lat = snapshot.value['lat'];
        // lng = snapshot.value['lng'];
        // dateTime = snapshot.value['dateTime'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Demo"),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Device ID : ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                deviceId,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Date/Time : ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                dateTime,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Latitude : ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                lat,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Longitude : ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                lng,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
