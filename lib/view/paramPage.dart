import 'package:flutter/material.dart';
import '../widget/appBarCustom.dart';

class ParamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context),
      body : Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text("Coming Soon"),
        ),
      ),
    );
  }
}
