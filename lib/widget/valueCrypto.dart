import 'package:flutter/material.dart';
import '../controller/variables.dart';

Column valueCrypto(String priceCrypto, String pourcentageCrypto) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Text(
        priceCrypto,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10.0),
      Text(
        pourcentageCrypto,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: green,
        ),
      )
    ],
  );
}