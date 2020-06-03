import 'package:flutter/material.dart';
import '../controller/variables.dart';
import '../controller/routes.dart';

class AppBarCustomMain extends AppBar {
  AppBarCustomMain(
    dynamic context,
    String page, {
    String title = "CryptoCap",
  }) : super(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 32.0,
              shadows: [
                Shadow(
                  color: black,
                  offset: Offset(3, 3),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(10.0),
              iconSize: 28.0,
              icon: Icon(Icons.settings),
              onPressed: (page != paramPage) ? () {
                Navigator.pushNamed(context, paramPage);
              } : null,
            ),
          ],
          centerTitle: true,
          backgroundColor: blueMain,
        );
}
