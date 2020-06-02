import 'package:flutter/material.dart';

Widget cryptoLoadingWidget(BuildContext context) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
    ),
  );
}