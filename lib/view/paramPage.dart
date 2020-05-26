import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/appBarCustom.dart';
import '../controller/variables.dart';

class ParamPage extends StatefulWidget {
  @override
  _ParamPageState createState() => _ParamPageState();
}

class _ParamPageState extends State<ParamPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustomSecond(context),
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Container(
            color: blueMain,
            width: widthTotal,
            height: double.infinity,
          ),

          // Github Button
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.25,
            child: IconButton(
              tooltip: "Github",
              alignment: Alignment.topCenter,
              iconSize: 60.0,
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: Image.network(
                  "https://i.imgur.com/ZpynXZc.png",
                ),
              ),
              onPressed: () {
                launch("https://github.com/Maxvyr");
              },
            ),
          ),

          // Instagram Button
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.25,
            child: IconButton(
              tooltip: "Instagram",
              iconSize: 60.0,
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  "https://i.imgur.com/L1AqDk9.png",
                ),
              ),
              onPressed: () {
                launch("https://www.instagram.com/koji.click/");
              },
            ),
          ),

          // Donate button
          Positioned(
            top: MediaQuery.of(context).size.height * 0.14,
            left: MediaQuery.of(context).size.width * 0.25,
            child: IconButton(
              tooltip: "BuyMeACoffee",
              alignment: Alignment.topCenter,
              iconSize: 200.0,
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  "https://i.imgur.com/PKmxX3q.png",
                ),
              ),
              onPressed: () {
                launch("https://www.buymeacoffee.com/maxvy");
              },
            ),
          ),

          // Dark Mode
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30,
            left: 15.0,
            child: Row(
              children: <Widget>[
                Text(
                  "Dark Mode : ",
                  style: TextStyle(
                    fontFamily: fontApp,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                ),
                Switch(
                  value: darkMode,
                  onChanged: (bool b) {
                    setState(() {
                      darkMode = b;
                    });
                  },
                ),
              ],
            ),
          ),


          // Brand
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.03,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: widthTotal,
                    height: 1.5,
                    color: black,
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    " App version 1.0.0",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontFamily: fontApp, fontSize: 10.0),
                  ),
                  Text(
                    "  Pandamy - Maxvyr",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontFamily: fontApp, fontSize: 10.0),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
