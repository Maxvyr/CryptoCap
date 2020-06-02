import 'package:flutter/material.dart';
import '../controller/variables.dart';

Widget errorCrytoWidget(BuildContext context) {
  return Center(
    child: Text(
      "Error loading coins!\nPlease check your connection",
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontWeight: FontWeight.w600,
        fontFamily: fontApp,
      ),
    ),
  );
}