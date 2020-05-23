import 'package:flutter/material.dart';
import '../controller/variables.dart';

Text textNameCrypto(String nameCrypto) {
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