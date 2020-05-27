import 'controller/variables.dart';
import 'view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'view/paramPage.dart';
import 'controller/routes.dart';

void main() => runApp(CryptoCapApp());

class CryptoCapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: blueMain,
        accentColor: accentColor,
      ),
      initialRoute: homePage,
      routes: {
        homePage : (context) => HomeScreen(),
        paramPage : (context) => ParamPage(),
      },
    );
  }
}


