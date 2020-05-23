import 'package:flutter/material.dart';
import 'controller/routes.dart';
import 'view/homePage.dart';
import 'view/paramPage.dart';

void main() => runApp(CryptoCapApp());

class CryptoCapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCap',
      debugShowCheckedModeBanner: false,
      initialRoute: homePage,
      routes: {
        homePage : (context) => HomePage(),
        paramPage : (context) => ParamPage(),
      },
    );
  }
}


