import 'package:flutter/material.dart';
import '../controller/variables.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CryptoCap",
          style: TextStyle(
            fontSize: 32.0,
            shadows: [
              Shadow(
                color: black,
                offset: Offset(1, 1),
                blurRadius: 4.0,
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: blueMain,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contenu Comming soon',
            ),
          ],
        ),
      ),
    );
  }
}
