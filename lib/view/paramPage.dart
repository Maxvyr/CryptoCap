import 'package:cryptocap/controller/variables.dart';
import 'package:flutter/material.dart';
import '../widget/appBarCustom.dart';

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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                "https://i.imgur.com/JZmCKtk.png",
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                "https://i.imgur.com/misGMbi.png",
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width*0.25,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                "https://i.imgur.com/Z5twSh1.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
