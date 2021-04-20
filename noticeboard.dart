import 'package:Tobi/Pages/complain.dart';
import 'package:Tobi/Pages/myComplains.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  User currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5FA),
      body: DefaultTabController(
          length: 3,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Color(0xFFF5F5FA),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TabBar(
                    labelPadding: EdgeInsets.only(top: 10),
                    tabs: [
                      Tab(
                        child: Image.asset('assets/Noticeboard/dog.png'),
                      ),
                      Tab(
                        child: Image.asset('assets/Noticeboard/cross.png'),
                      ),
                      Tab(
                        child: Image.asset('assets/Noticeboard/hand.png'),
                      ),
                    ],
                    labelColor: Colors.red,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.black),
                      insets: EdgeInsets.only(bottom: 60),
                    ),
                    unselectedLabelColor: Colors.grey,
                  ),
                ),
                body: TabBarView(
                  children: [
                    Center(
                      child: Text(
                        "Tab 01",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Tab 02",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    MyComPlains(currentUser.uid),
                    // Center(
                    //   child: Text(
                    //     "Tab 03",
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
