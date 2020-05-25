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
      body : Container(
        color: blueMain,
        width: widthTotal,
        height: double.infinity,
        child: Center(
          child: Text("Coming Soon"),
        ),
      ),
    );
  }
}
