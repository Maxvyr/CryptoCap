import 'package:flutter/material.dart';
import '../controller/variables.dart';
import '../controller/routes.dart';

AppBar appBarCustom(BuildContext context) {
  return AppBar(
    title: Text(
      "CryptoCap",
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
        iconSize: 20.0,
        icon: Icon(Icons.settings),
        onPressed: () {
          Navigator.pushNamed(context, paramPage);
        },
      ),
    ],
    centerTitle: true,
    backgroundColor: blueMain,
  );
}