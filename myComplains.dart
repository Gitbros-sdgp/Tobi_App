import 'package:Tobi/Pages/complain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyComPlains extends StatefulWidget {
  @override
  _MyComPlainsState createState() => _MyComPlainsState();
  String uid;
  MyComPlains(this.uid);
}

class _MyComPlainsState extends State<MyComPlains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
          title: Text(" My Complains"),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_circle,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ComplainPage()));
          },
        ),
        body: ComplainList(widget.uid));
  }
}

class ComplainWidget extends StatefulWidget {
  @override
  _ComplainWidgetState createState() => _ComplainWidgetState();
  String animalSpecies, location, dateTime, complain;
  ComplainWidget(
      this.animalSpecies, this.location, this.dateTime, this.complain);
}

class _ComplainWidgetState extends State<ComplainWidget> {
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
                    "About              :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    widget.animalSpecies,
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
                "Complain",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 50, 30),
              child: Text(
                widget.complain,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComplainList extends StatefulWidget {
  @override
  _ComplainListState createState() => _ComplainListState();
  String uid;
  ComplainList(this.uid);
}

class _ComplainListState extends State<ComplainList> {
  @override
  Widget build(BuildContext context) {
    CollectionReference pets = FirebaseFirestore.instance
        .collection('Complains/${widget.uid}/myComplains');

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
              child: new ComplainWidget(
                  document.data()['animalSpecies'],
                  document.data()['location'],
                  document.data()['dateTime'],
                  document.data()['complain']),
            );
          }).toList(),
        );
      },
    );
  }
}
