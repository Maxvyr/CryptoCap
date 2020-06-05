import 'package:cryptocap/view/cryptoPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc.dart';
import 'controller/variables.dart';
import 'view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'view/paramPage.dart';
import 'controller/routes.dart';
import './repositories/cryptoRepository.dart';

void main() => runApp(CryptoCapApp());

class CryptoCapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoBloc>(
      create: (_) => CryptoBloc(
        cryptoRepository: CryptoRepository(),
      )..add(
          AppStarted(),
        ),
      child: MaterialApp(
        title: "CryptoCap",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: blueMain,
          accentColor: accentColor,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: white,
        ),
        initialRoute: homePage,
        routes: {
          homePage: (context) => HomeScreen(),
          paramPage: (context) => ParamPage(),
          cryptoPage: (context) => CryptoPage(),
        },
      ),
    );
  }
}
