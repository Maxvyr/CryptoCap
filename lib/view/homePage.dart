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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 5.0),
                cardCrypto("Bitcoin","https://static.wixstatic.com/media/34705a_11dec616ff0d41efa5215a10abf7d96f~mv2.png/v1/fit/w_190,h_56/34705a_11dec616ff0d41efa5215a10abf7d96f~mv2.png","9173.32","2.5"),
                cardCrypto("Ethereum","https://static.wixstatic.com/media/34705a_ce63336c20794a45ba82aca6cc1cd9fc~mv2.png/v1/fit/w_190,h_56/34705a_ce63336c20794a45ba82aca6cc1cd9fc~mv2.png","233.38","4"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
