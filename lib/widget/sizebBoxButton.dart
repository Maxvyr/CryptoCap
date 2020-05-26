import 'package:flutter/material.dart';
import '../controller/variables.dart';

class SizedBoxButton extends SizedBox {
  //Constructeur
  SizedBoxButton(
      BuildContext context,
      String imageButton,
      dynamic pressedButton, {
        double pourcentageHeight = 0.25,
        double pourcentageWidth = 0.35,
      }) : super (
      width: MediaQuery.of(context).size.width * pourcentageWidth,
      height: MediaQuery.of(context).size.height * pourcentageHeight,
      child: RaisedButton(
        onPressed: pressedButton,
        color: white,
        elevation: 25.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.network(
            imageButton,
            fit: BoxFit.fill,
          ),
        ),
      ));
}