import 'package:dog_breed_details/main.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';
import 'package:dog_breed_details/DogBreedsList.dart';

void main() => runApp(DogPageApp());

String currentBreed;
String currentBreedImage;
String currentBreedLifespan;
String currentBreedShortHistory;
String currentBreedFriendlinessNumber;
String currentBreedFriendlinessText;
String currentBreedActivityNumber;
String currentBreedActivityText;

String currentBreedPageSize;
String currentBreedPagePersonality;
String currentBreedPageHealth;
String currentBreedPageCare;
String currentBreedPageFeeding;
String currentBreedPageGrooming;
String currentBreedPageBehaviour;

class DogPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Dog Breeds',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: DogPage(),
    );
  }
}

class DogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              backgroundColor: purple,
              elevation: 0.0,
            )),
        floatingActionButton: new FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.deepPurple[800],
          mini: true,
          child: new Icon(Icons.favorite_border),
        ),
        body: Scrollbar(
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
          new BreedTitleWithImage(),
          Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Short history
                new BreedShortHistoryTitle(),
                new BreedShortHistoryText(),

                Row(children: <Widget>[
                  Container(
                      margin:
                          EdgeInsets.only(left: 26.0, top: 26.0, bottom: 26.0),
                      child: Row(
                        children: <Widget>[
                          // Friendliness percent Indicator
                          new BreedFriendlinessCircularPercentIndicator(),
                          Container(
                              margin: EdgeInsets.only(left: 26.0),
                              child: Text('Friendliness',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w300))),
                        ],
                      )),
                  Container(
                      margin:
                          EdgeInsets.only(left: 26.0, top: 26.0, bottom: 26.0),
                      child: Row(
                        children: <Widget>[
                          // Activity percent Indicator
                          new BreedActivityCircularPercentIndicator(),
                          Container(
                              margin: EdgeInsets.only(left: 26.0),
                              child: Text('Dog activity',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w300))),
                        ],
                      ))
                ]),

                Container(
                    margin:
                        EdgeInsets.only(left: 26.0, right: 26.0, bottom: 16.0),
                    child: Divider(
                      color: Colors.grey[300],
                    )),

                // Breed size
                currentBreedPageSize == "empty"
                    ? Container()
                    : new BreedSizeTitle(),
                currentBreedPageSize == "empty"
                    ? Container()
                    : new BreedSizeText(),
                currentBreedPageSize == "empty"
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(
                            left: 26.0, top: 16.0, right: 26.0, bottom: 16.0),
                        child: Divider(
                          color: Colors.grey[300],
                        )),

                // Expandable
                /*Container(
      margin: EdgeInsets.only( left: 26.0, right: 26.0),
      child: ExpansionTile( 
        title: Container (child: Text("Personality", style: TextStyle(
                fontSize: 25.0,
                color: purple,
                fontWeight: FontWeight.w400))),
        children: <Widget> [ Container ( margin: EdgeInsets.only(bottom: 16.0), child: Text(currentBreedPagePersonality, style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)))],
      )),*/

                // Breed personality
                currentBreedPagePersonality == "empty"
                    ? Container()
                    : new BreedPersonalityTitle(),
                currentBreedPagePersonality == "empty"
                    ? Container()
                    : new BreedPersonalityText(),
                currentBreedPagePersonality == "empty"
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(
                            left: 26.0, top: 16.0, right: 26.0, bottom: 16.0),
                        child: Divider(
                          color: Colors.grey[300],
                        )),

                // Breed health
                currentBreedPageHealth == "empty"
                    ? Container()
                    : new BreedHealthTitle(),
                currentBreedPageHealth == "empty"
                    ? Container()
                    : new BreedHealthText(),
                currentBreedPageHealth == "empty"
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(
                            left: 26.0, top: 16.0, right: 26.0, bottom: 16.0),
                        child: Divider(
                          color: Colors.grey[300],
                        )),

                // Breed Care
                currentBreedPageCare == "empty"
                    ? Container()
                    : new BreedCareTitle(),
                currentBreedPageCare == "empty"
                    ? Container()
                    : new BreedCareText(),
                currentBreedPageCare == "empty"
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(
                            left: 26.0, top: 16.0, right: 26.0, bottom: 16.0),
                        child: Divider(
                          color: Colors.grey[300],
                        )),

                // Breed feeding
                currentBreedPageFeeding == "empty"
                    ? Container()
                    : new BreedFeedingTitle(),
                currentBreedPageFeeding == "empty"
                    ? Container()
                    : new BreedFeedingText(),
                currentBreedPageFeeding == "empty"
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(
                            left: 26.0, top: 16.0, right: 26.0, bottom: 16.0),
                        child: Divider(
                          color: Colors.grey[300],
                        )),

                // Breed grooming
                currentBreedPageGrooming == "empty"
                    ? Container()
                    : new BreedGroomingTitle(),
                currentBreedPageGrooming == "empty"
                    ? Container()
                    : new BreedGroomingText(),
                currentBreedPageGrooming == "empty"
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(
                            left: 26.0, top: 16.0, right: 26.0, bottom: 16.0),
                        child: Divider(
                          color: Colors.grey[300],
                        )),

                // Breed behaviour
                currentBreedPageBehaviour == "empty"
                    ? Container()
                    : new BreedBehaviourTitle(),
                currentBreedPageBehaviour == "empty"
                    ? Container()
                    : new BreedBehaviourText(),
              ],
            ),
          ])
        ])));
  }
}

class BreedBehaviourText extends StatelessWidget {
  const BreedBehaviourText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: 26.0, top: 16.0, right: 26.0, bottom: 26.0),
        child: Text(currentBreedPageBehaviour,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)));
  }
}

class BreedBehaviourTitle extends StatelessWidget {
  const BreedBehaviourTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0),
        child: Text('Children And Other Pets',
            style: TextStyle(
                fontSize: 25.0, color: purple, fontWeight: FontWeight.w400)));
  }
}

class BreedGroomingText extends StatelessWidget {
  const BreedGroomingText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0, top: 16.0, right: 26.0),
        child: Text(currentBreedPageGrooming,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)));
  }
}

class BreedGroomingTitle extends StatelessWidget {
  const BreedGroomingTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0),
        child: Text('Coat Color And Grooming',
            style: TextStyle(
                fontSize: 25.0, color: purple, fontWeight: FontWeight.w400)));
  }
}

class BreedFeedingText extends StatelessWidget {
  const BreedFeedingText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0, top: 16.0, right: 26.0),
        child: Text(currentBreedPageFeeding,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)));
  }
}

class BreedFeedingTitle extends StatelessWidget {
  const BreedFeedingTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0),
        child: Text('Feeding',
            style: TextStyle(
                fontSize: 25.0, color: purple, fontWeight: FontWeight.w400)));
  }
}

class BreedCareText extends StatelessWidget {
  const BreedCareText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0, top: 16.0, right: 26.0),
        child: Text(currentBreedPageCare,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)));
  }
}

class BreedCareTitle extends StatelessWidget {
  const BreedCareTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0),
        child: Text('Care',
            style: TextStyle(
                fontSize: 25.0, color: purple, fontWeight: FontWeight.w400)));
  }
}

class BreedHealthText extends StatelessWidget {
  const BreedHealthText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0, top: 16.0, right: 26.0),
        child: Text(currentBreedPageHealth,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)));
  }
}

class BreedHealthTitle extends StatelessWidget {
  const BreedHealthTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0),
        child: Text('Health',
            style: TextStyle(
                fontSize: 25.0, color: purple, fontWeight: FontWeight.w400)));
  }
}

class BreedPersonalityText extends StatelessWidget {
  const BreedPersonalityText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0, top: 16.0, right: 26.0),
        child: Text(currentBreedPagePersonality,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)));
  }
}

class BreedPersonalityTitle extends StatelessWidget {
  const BreedPersonalityTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0),
        child: Text('Personality',
            style: TextStyle(
                fontSize: 25.0, color: purple, fontWeight: FontWeight.w400)));
  }
}

class BreedSizeText extends StatelessWidget {
  const BreedSizeText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0, top: 16.0, right: 26.0),
        child: Text(currentBreedPageSize,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)));
  }
}

class BreedSizeTitle extends StatelessWidget {
  const BreedSizeTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0),
        child: Text('Size',
            style: TextStyle(
                fontSize: 25.0, color: purple, fontWeight: FontWeight.w400)));
  }
}

class BreedActivityCircularPercentIndicator extends StatelessWidget {
  const BreedActivityCircularPercentIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CircularPercentIndicator(
      radius: 40.0,
      lineWidth: 2.0,
      percent: double.parse(currentBreedActivityNumber),
      center:
          new Text(currentBreedActivityText, style: TextStyle(color: purple)),
      progressColor: purple,
      backgroundColor: Colors.grey[300],
      animation: true,
      animationDuration: 1200,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

class BreedFriendlinessCircularPercentIndicator extends StatelessWidget {
  const BreedFriendlinessCircularPercentIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CircularPercentIndicator(
      radius: 40.0,
      lineWidth: 2.0,
      percent: double.parse(currentBreedFriendlinessNumber),
      center: new Text(
        currentBreedFriendlinessText,
        style: TextStyle(color: purple),
      ),
      backgroundColor: Colors.grey[300],
      progressColor: purple,
      animation: true,
      animationDuration: 1200,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

class BreedShortHistoryText extends StatelessWidget {
  const BreedShortHistoryText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 26.0, top: 16.0, right: 26.0),
        child: Text(currentBreedShortHistory,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
                height: 1.1)));
  }
}

class BreedShortHistoryTitle extends StatelessWidget {
  const BreedShortHistoryTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 26.0, left: 26.0),
        child: Text('Short history',
            style: TextStyle(
                fontSize: 25.0, color: purple, fontWeight: FontWeight.w400)));
  }
}

class BreedTitleWithImage extends StatelessWidget {
  const BreedTitleWithImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: new PurpleBackground(),
          ),
          // Back button
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 23.0, top: 0.0),
              height: 50.0,
              width: 90.0,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey[300],
                    size: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3.0),
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Route route = MaterialPageRoute(builder: (context) => MyApp());
              Navigator.pushReplacement(context, route);
            },
          ),
          // Dog breed
          Container(
            width: screenWidth,
            margin: EdgeInsets.only(left: 26, top: 55.0),
            child: Text(currentBreed,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 36.0,
                    color: Colors.white)),
          ),
          // Lifespan
          Container(
            margin: EdgeInsets.only(left: 26, top: 90),
            child: Text(currentBreedLifespan,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    color: Colors.white)),
          ),
          // Breed image
          Container(
            height: 220.0,
            margin: EdgeInsets.only(top: 120.0),
            child: Center(child: Image.network(currentBreedImage)),
          ),
        ],
      ),
    ));
  }
}

class PurpleBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: double.infinity,
        height: 330.0,
        //color: purple,
        decoration: new BoxDecoration(
          color: purple,
          image: DecorationImage(
            image: NetworkImage(
                'https://github.com/Gitbros-sdgp/Tobi_App/blob/35e18f04281edc20eb949b0785b8bbdcdf43c145/tobiimg1.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      clipper: RoundedClipper(),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
