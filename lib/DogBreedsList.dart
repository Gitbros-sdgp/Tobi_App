import 'dart:convert';

import 'package:dog_breed_details/DogPage.dart';
import 'package:flutter/material.dart';
import 'package:dog_breed_details/entities/Data.dart';
import 'package:http/http.dart' as http;
import 'package:dog_breed_details/HomePageAppBar.dart';
import 'package:dog_breed_details/main.dart';

void main() => runApp(MyApp());

double screenWidth;
double screenHeight;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: 'Dog Breeds: Homepage',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Breed> _breeds = List<Breed>();
  List<Breed> _breedsForDisplay = List<Breed>();

  Future<List<Breed>> fetchNotes() async {
    try {
      var url =
          'https://github.com/Gitbros-sdgp/Tobi_App/blob/1e23a3cc5c5ca6bf645700661d9ca145fa85e849/data.json';
      var response = await http.get(url);

      var notes = List<Breed>();

      if (response.statusCode == 200) {
        var notesJson = json.decode(response.body);
        for (var noteJson in notesJson) {
          notes.add(Breed.fromJson(noteJson));
        }
      }
      return notes;
    } catch (e) {
      _showDialog();
      return null;
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: yellow.withOpacity(0.5),
          ),
          child: AlertDialog(
            title: new Text("Ooops, something went wrong"),
            content: new Text(
                "Please, check your internet connection in order to use this app"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Refresh",
                    style: TextStyle(
                        color: yellow,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
                onPressed: () {
                  Navigator.pop(context);
                  Route route =
                      MaterialPageRoute(builder: (context) => MyApp());
                  Navigator.pushReplacement(context, route);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _breeds.addAll(value);
        _breedsForDisplay = _breeds;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new HomePageAppBar(),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() : _listItem(index - 1);
          },
          itemCount: _breedsForDisplay.length + 1,
        ));
  }

  _searchBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: new Container(
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              filled: true,
              fillColor: Colors.grey[200],
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 15.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
              ),
            ),
            onChanged: (text) {
              text = text.toLowerCase();
              setState(() {
                _breedsForDisplay = _breeds.where((note) {
                  var noteTitle = note.breed.toLowerCase();
                  return noteTitle.contains(text);
                }).toList();
              });
            },
          ),
        ));
  }

  _listItem(index) {
    return GestureDetector(
        onTap: () {
          print("Container was tapped - " + _breedsForDisplay[index].breed);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DogPageApp()),
          );

          currentBreed = _breedsForDisplay[index].breed;
          currentBreedImage = _breedsForDisplay[index].breedPageImage;
          currentBreedLifespan = _breedsForDisplay[index].breedPageLifespan;
          currentBreedShortHistory =
              _breedsForDisplay[index].breedPageShortHistory;
          currentBreedFriendlinessNumber =
              _breedsForDisplay[index].breedPageFriendlinessNumber;
          currentBreedFriendlinessText =
              _breedsForDisplay[index].breedPageFriendlinessText;
          currentBreedActivityNumber =
              _breedsForDisplay[index].breedPageActivityNumber;
          currentBreedActivityText =
              _breedsForDisplay[index].breedPageActivityText;
          currentBreedPageSize = _breedsForDisplay[index].breedPageSize;
          currentBreedPagePersonality =
              _breedsForDisplay[index].breedPagePersonality;
          currentBreedPageHealth = _breedsForDisplay[index].breedPageHealth;
          currentBreedPageCare = _breedsForDisplay[index].breedPageCare;
          currentBreedPageFeeding = _breedsForDisplay[index].breedPageFeeding;
          currentBreedPageGrooming = _breedsForDisplay[index].breedPageGrooming;
          currentBreedPageBehaviour =
              _breedsForDisplay[index].breedPageBehaviour;
        },
        child: Container(
          margin: const EdgeInsets.only(
            top: 16.0,
            bottom: 0.0,
            left: 16.0,
            right: 20.0,
          ),
          child: new Stack(
            children: <Widget>[
              Container(
                width: 45.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 3.0),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(_breedsForDisplay[index].breedListImage),
                    /*new AssetImage(
                        _breedsForDisplay[index].breedListImage),*/ // Breed image
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.topCenter,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /* Breed name */
                  new Container(
                      width: screenWidth - 90,
                      margin: EdgeInsets.only(left: 56.0),
                      child: Text(_breedsForDisplay[index].breed,
                          style: TextStyle(
                              color: yellow,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300))),
                  /* Description */
                  new Container(
                      width: screenWidth - 90,
                      margin: EdgeInsets.only(top: 5.0, left: 56.0),
                      child: Text(_breedsForDisplay[index].breedListDescription,
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 13.0,
                              fontWeight: FontWeight.w200))),
                  /* Separator */
                  new Container(
                    height: 1.0,
                    margin: const EdgeInsets.only(
                        left: 56.0, top: 16.0, bottom: 0.0),
                    color: Colors.grey[200],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
