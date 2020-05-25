import 'package:flutter/material.dart';
import '../controller/variables.dart';

Widget containerMarketCapAndVolum(
    BuildContext context, String valueMarket, String value24hVolum) {
  return Container(
    color: white,
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.015,
          child: Text(
            "Market Capitalisation",
            style: TextStyle(
              fontFamily: fontApp,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          child: Text(
            "$valueMarket Bn\$",
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: fontApp,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          child: Container(
            color: blueMain,
            width: double.maxFinite,
            height: 3.0,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.14,
          child: Text(
            "24h Volume",
            style: TextStyle(
              fontFamily: fontApp,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.18,
          child: Text(
            "$value24hVolum Bn\$",
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: fontApp,
            ),
          ),
        ),
      ],
    ),
  );
}
