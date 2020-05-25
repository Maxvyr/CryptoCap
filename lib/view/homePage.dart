import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/cardCrypto.dart';
import '../controller/variables.dart';
import '../widget/appBarCustom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustomMain(context),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: blueMain,
            width: widthTotal,
            height: MediaQuery.of(context).size.height,
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Container(
                    color: white,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.015,
                          child: Text("Market Capitalisation"),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.05,
                          child: Text(
                            "247 910 Bn\$",
                            style: TextStyle(fontSize: 35.0),
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
                          child: Text("24h Volume"),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.18,
                          child: Text(
                            "126 50 Bn\$",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                cardCrypto(
                    "Bitcoin",
                    "https://static.wixstatic.com/media/34705a_11dec616ff0d41efa5215a10abf7d96f~mv2.png/v1/fit/w_190,h_56/34705a_11dec616ff0d41efa5215a10abf7d96f~mv2.png",
                    "9173.32",
                    "2.5"),
                cardCrypto(
                    "Ethereum",
                    "https://static.wixstatic.com/media/34705a_ce63336c20794a45ba82aca6cc1cd9fc~mv2.png/v1/fit/w_190,h_56/34705a_ce63336c20794a45ba82aca6cc1cd9fc~mv2.png",
                    "233.38",
                    "4"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
