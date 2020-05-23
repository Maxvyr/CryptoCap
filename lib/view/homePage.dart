import 'package:cryptocap/controller/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                      Text(
                        "Bitcoin",
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
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "9173.32\$",
                          ),
                          Text(
                            "+2.5%",
                          )
                        ],
                      )
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
