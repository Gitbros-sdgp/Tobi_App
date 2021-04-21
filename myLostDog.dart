import 'package:Tobi/Pages/lostDog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyLostDog extends StatefulWidget {
  @override
  _MyLostDogState createState() => _MyLostDogState();
  String uid;
  MyLostDog(this.uid);
}

class _MyLostDogState extends State<MyLostDog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
          title: Text(" Lost dogs"),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_circle,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LostdogPage()));
          },
        ),
        body: LostDogList(widget.uid));
  }
}

class LostDogWidget extends StatefulWidget {
  @override
  _LostDogWidgetState createState() => _LostDogWidgetState();
  String breed, location, dateTime, text, mobile, displayName;
  LostDogWidget(this.breed, this.location, this.dateTime, this.text,
      this.mobile, this.displayName); //storelistview
}

class _LostDogWidgetState extends State<LostDogWidget> {
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
                    "Owner              :",
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
                    "Date / Time   :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.dateTime,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 50, 10),
              child: Text(
                "Text",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 50, 30),
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 50, 10),
              child: Text(
                "Mobile number",
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

class LostDogList extends StatefulWidget {
  @override
  _LostDogListState createState() => _LostDogListState();
  String uid;
  LostDogList(this.uid);
}

class _LostDogListState extends State<LostDogList> {
  @override
  Widget build(BuildContext context) {
    CollectionReference pets =
        FirebaseFirestore.instance.collection('Lostdogs');

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
              child: new LostDogWidget(
                  document.data()['breed'],
                  document.data()['location'],
                  document.data()['dateTime'],
                  document.data()['text'],
                  document.data()['mobilenumber'],
                  document.data()['displayName']),
            );
          }).toList(),
        );
      },
    );
  }
}
