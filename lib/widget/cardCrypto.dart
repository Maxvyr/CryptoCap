import 'package:flutter/material.dart';
import '../controller/variables.dart';
import 'textNameCrypto.dart';
import 'valueCrypto.dart';

Card cardCrypto() {
  return Card(
    color: white,
    elevation: 15.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/125px-Bitcoin.svg.png"),
        ),
        textNameCrypto("Bitcoin"),
        valueCrypto("9173.32\$", "+2.5%"),
      ],
    ),
  );
}