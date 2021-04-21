import 'package:Tobi/Pages/crossdog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCrossdog extends StatefulWidget {
  @override
  _MyCrossdogState createState() => _MyCrossdogState();
  String uid;
  MyCrossdog(this.uid);
}

class _MyCrossdogState extends State<MyCrossdog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
          title: Text(" My Crossdog"),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_circle,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CrossdogPage()));
          },
        ),
        body: CrossdogList(widget.uid));
  }
}

// ignore: must_be_immutable
class CrossdogWidget extends StatefulWidget {
  @override
  _CrossdogWidgetState createState() => _CrossdogWidgetState();
  String breed, location, age, mobile, displayName;
  CrossdogWidget(this.breed, this.location, this.age, this.mobile,
      this.displayName); //store
}

class _CrossdogWidgetState extends State<CrossdogWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 200, 200, 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 50, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "owner              :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.displayName,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 50, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Breed              :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.breed,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 50, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Location         :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.location,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 50, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Age :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.age,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 50, 10),
              child: Text(
                "Mobile",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 50, 30),
              child: Text(
                widget.mobile,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CrossdogList extends StatefulWidget {
  @override
  _CrossdogListState createState() => _CrossdogListState();
  String uid;
  CrossdogList(this.uid);
}

class _CrossdogListState extends State<CrossdogList> {
  @override
  Widget build(BuildContext context) {
    CollectionReference pets =
        FirebaseFirestore.instance.collection('Crossdogs');

    return StreamBuilder<QuerySnapshot>(
      stream: pets.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print("Something went worng");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loding");
        }
        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            // print(document.data());
            return new Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: new CrossdogWidget(
                  document.data()['breed'],
                  document.data()['location'],
                  document.data()['age'],
                  document.data()['mobile'],
                  document.data()['displayName']),
            );
          }).toList(),
        );
      },
    );
  }
}
