import 'package:flutter/material.dart';
import '../controller/variables.dart';
import '../widget/valueCrypto.dart';
import '../widget/textNameCrypto.dart';
import '../widget/appBarCustom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: blueMain,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 5.0),
                Card(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
