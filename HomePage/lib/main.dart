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
    return new Scaffold(
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
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Welcome back, Pathum",
                      style: new TextStyle(fontSize: 30.0),
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
