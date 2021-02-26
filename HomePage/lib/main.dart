import 'package:flutter/material.dart';

void main() => runApp(homePage());

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Actor'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xFFF5F5FA),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                          child: new Image.asset(
                            'assets/homePage/IMG-20200920-WA0078.jpg',
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                    child: new Text(
                      "Welcome back, Pathum",
                      style: new TextStyle(fontSize: 30.0),
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 21.0,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 21.0,
                        top: 13.0,
                        bottom: 210.0,
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
                                'assets/homePage/socialIcon.jpg',
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
                                'Social Media',
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
            ],
          ),
        ),
      ),
    );
  }
}
