import 'package:flutter/material.dart';
import '../controller/variables.dart';

Widget cardCrypto(String name, String imgLink, String value, String pourcent) {
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

Widget textNameCrypto(String nameCrypto) {
  return Text(
    nameCrypto,
    style: TextStyle(
      fontSize: 42.0,
      shadows: [
        Shadow(
          color: blueMain,
          offset: Offset(1.0, 1.0),
          blurRadius: 4.0,
        ),
      ],
    ),
  );
}

Widget valueCrypto(String priceCrypto, String pourcentageCrypto) {
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