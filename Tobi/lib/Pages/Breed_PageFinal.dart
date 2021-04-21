import 'package:flutter/material.dart';

class BreedPageFinal extends StatefulWidget {
  @override
  MyBreedPageFinal createState() => MyBreedPageFinal();
}

class MyBreedPageFinal extends State<BreedPageFinal> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 230.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                ),
                child: Text(
                  "Breed Detection",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              background: PreferredSize(
                preferredSize: Size.fromHeight(256.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(color: Color(0xFFFFD500)),
                      height: 256.0,
                      width: 410.0,
                      child: new Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: new BorderRadius.circular(100.0),
                            child: new Image.asset(
                              "assets/BreedPageTwo/dog2.png",
                              height: 121.0,
                              width: 121.0,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Container(
                color: Color(0xFFF5F5FA),
                child: Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                          ),
                          child: new Container(
                            height: 200.0,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5FA),
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFAAAACC),
                                  blurRadius: 10.0,
                                  offset: Offset(6, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(
                                'assets/homePage/IMG-20200920-WA0078.jpg',
                                fit: BoxFit.fill,
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
                            top: 30.0,
                          ),
                          child: new Text(
                            'Labrador Retriever',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Actor',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
