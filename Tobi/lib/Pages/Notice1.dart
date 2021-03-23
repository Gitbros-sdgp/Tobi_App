import 'package:Tobi/Pages/Abuse1.dart';
import 'package:Tobi/Pages/cross.dart';
import 'package:Tobi/Pages/dog.dart';
import 'package:flutter/material.dart';

class Noticebord extends StatefulWidget {
  Noticebord();
  @override
  _NoticebordState createState() => _NoticebordState();
}

class _NoticebordState extends State<Noticebord> {
  _NoticebordState();
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            // Container(
            //   height: double.infinity,
            //   width: double.infinity,
            // ),
            Scaffold(
              backgroundColor: Color.fromARGB(255, 200, 213, 0),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 36),
                child: TabBar(
                  labelPadding: EdgeInsets.only(top: 20),
                  tabs: <Widget>[
                    Tab(
                      child: Image.asset('assets/cross.png', height: 50),
                    ),
                    Tab(child: Image.asset('assets/hand.png', height: 50)),
                    Tab(
                      child: Image.asset('assets/dog.png', height: 50),
                    ),
                  ],
                  labelColor: Colors.red,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.white, width: 8.0),
                    insets: EdgeInsets.only(bottom: 65),
                  ),
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              body: TabBarView(children: <Widget>[
                Lossdog(),
                Abusedog(),
                Cross(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
