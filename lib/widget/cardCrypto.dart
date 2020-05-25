import 'package:flutter/material.dart';
import '../controller/variables.dart';
import 'textNameCrypto.dart';

Card cardCrypto(String name, String imgLink, String value, String pourcent) {
  return Card(
    color: white,
    elevation: 15.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.network(imgLink),
        ),
        textNameCrypto(name),
        valueCrypto(value, pourcent),
      ],
    ),
  );
}

Column valueCrypto(String priceCrypto, String pourcentageCrypto) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Text(
        "$priceCrypto \$",
        style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10.0),
      Text(
        "$pourcentageCrypto%",
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: green,
        ),
      )
    ],
  );
}