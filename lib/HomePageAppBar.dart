import 'package:flutter/material.dart';
import 'package:dog_breed_details/main.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  final title = 'Dog Breeds';

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: purple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Image.asset(
            'lib/assets/img/pawprint.png',
            height: 18.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.0),
            child: Text(title),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
