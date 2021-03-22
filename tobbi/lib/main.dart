import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confirm Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Container(
                    alignment: Alignment.center,
                    height: 256.0,
                    decoration: new BoxDecoration(color: Color(0xFFFFD500)),
                    child: Text('Breed Detection',style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center,),
                  ),
                ),
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
                    bottomRight: Radius.circular(30)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(6, 8), // changes position of shadow
                  ),
                ],
              ),
              height: 170.0,
              child: Text('Upload an image of an dog using the "Upload" button below. then, after a moment you will get the result.',style: TextStyle(fontSize: 18.0), textAlign: TextAlign.justify,),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30,0,30,30),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5FA),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                ),
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
            ),
            new Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(48, 0, 12, 0),
                    width: 127.0,
                    height: 47.0,
                    child: MaterialButton(child: Text('Upload',style: TextStyle(fontSize: 16.0),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      color: Color(0xFFFFD500),
                      onPressed: (){},
                    ),
                  ),
                  Text("Or"),
                  Container(
                    margin: const EdgeInsets.fromLTRB(12, 0, 42, 0),
                    width: 127.0,
                    height: 47.0,
                    child: MaterialButton(child: Text('Select again',style: TextStyle(fontSize: 16.0),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      color: Color(0xFFFFD500),
                      onPressed: (){},
                    ),
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}
