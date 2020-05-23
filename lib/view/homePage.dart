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
                cardCrypto(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
