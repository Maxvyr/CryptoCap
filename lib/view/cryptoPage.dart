import 'package:cryptocap/blocs/bloc.dart';
import 'package:cryptocap/widget/errorCryptoWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/routes.dart';
import '../controller/variables.dart';
import '../widget/containerMain.dart';
import '../widget/cryptoLoadingWidget.dart';
import '../widget/appBarCustom.dart';
import 'dart:math';

class CryptoPage extends StatefulWidget {
  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  int _index = 0;
  String _cryptoName;
  String _urlBuyCrypto =
      "https://www.coinbase.com/join/vidali_e?src=android-link";
  List<double> _cryptoValue = [];
  double price1d, price1h;

  @override
  void initState() {
    super.initState();
    _index = indexCrypto;
    _cryptoName = nameCryptoClick;
  }

  @override
  Widget build(BuildContext context) {
    // variable
    var screen = MediaQuery.of(context);
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;

    return Scaffold(
      appBar: AppBarCustomMain(
        context: context,
        page: cryptoPage,
        title: _cryptoName,
      ),
      body: SafeArea(
        child: ContainerMain(
          context,
          Center(
            child: BlocBuilder<CryptoBloc, CryptoState>(
              builder: (context, state) {
                return _buildPage(
                  state,
                  screen,
                  isDark,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _buildPage(CryptoState state, MediaQueryData screen, bool isDark) {
    // si pas de data alors affichage cercle de recherche
    if (state is CryptoLoading) {
      return cryptoLoadingWidget(context);
    } else if (state is CryptoLoaded) {
      /*
        stock les coin dans un list et
        l'index de cette liste est l'index qui correspond au click de l'utilisateur
        ceci permet d'afficher des détails de la crypto
      */
      // init variable
      final coin = state.coins[_index];

      /*
         calcPrevious value
         d'abord transfo le pourcentage en valeur comppris entre  -1 et 1
         ajouter 1 a la valeur abs du résultat
         si résultat positif * par addition sinon /
      */
      var _changeTempo24h = coin.changePct24h / 100;
      var _changeTempo1h = coin.changePct1h / 100;
      price1d = (_changeTempo24h <= 0)
          ? coin.price * (1 + _changeTempo24h.abs())
          : coin.price / (1 + _changeTempo24h.abs());
      price1h = (_changeTempo1h <= 0)
          ? coin.price * (1 + _changeTempo1h.abs())
          : coin.price / (1 + _changeTempo1h.abs());

      _cryptoValue = [
        price1d,
        price1h,
        coin.price,
      ];
      return Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screen.size.height * 0.001),

              // graph

              //container background
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35.0),
                    child: Container(
                      width: screen.size.width * 0.95,
                      height: screen.size.height * 0.5,
                      color: (isDark) ? grey : white,
                    ),
                  ),

                  //High Value
                  Positioned(
                    top: screen.size.height * 0.03,
                    left: 5.0,
                    child:
                        Text("${_cryptoValue.reduce(max).toStringAsFixed(4)}"),
                  ),

                  //Low Value
                  Positioned(
                    top: screen.size.height * 0.44,
                    left: 5.0,
                    child:
                        Text("${_cryptoValue.reduce(min).toStringAsFixed(4)}"),
                  ),

                  //Sparkline
                  Positioned(
                    top: screen.size.height * 0.05,
                    left: screen.size.width * 0.2,
                    child: Container(
                      height: screen.size.height * 0.4,
                      child: Sparkline(
                        data: _cryptoValue,
                        pointsMode: PointsMode.all,
                        pointColor: (isDark) ? white : Colors.lightBlue,
                        lineColor: (isDark) ? white : Colors.lightBlue,
                      ),
                    ),
                  ),

                  // time 24 hours
                  Positioned(
                    top: screen.size.height * 0.47,
                    left: screen.size.width * 0.22,
                    child: Text("24h"),
                  ),

                  // time 1 hour
                  Positioned(
                    top: screen.size.height * 0.47,
                    left: screen.size.width * 0.5,
                    child: Text("1h"),
                  ),
                ],
              ),

              // Button Buy crypto - Coinbase
              SizedBox(height: 25.0),
              RaisedButton(
                onPressed: () {
                  launch(_urlBuyCrypto);
                },
                elevation: 8.0,
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  width: screen.size.width * 0.8,
                  child: Center(
                    child: Text(
                      "Buy Crypto",
                      style: TextStyle(
                        fontFamily: fontApp,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800,
                        shadows: [
                          Shadow(
                            color: grey,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),

              //bloc data crypto
              ClipRRect(
                borderRadius: BorderRadius.circular(35.0),
                child: Container(
                  color: (isDark) ? grey : white,
                  width: screen.size.width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(height: 5.0),
                      rowCrypto(
                        isDark: isDark,
                        textDescribe: "Market Cap",
                        value: "\$ ${coin.marketCapCrypto}",
                      ),
                      rowCrypto(
                        isDark: isDark,
                        textDescribe: "24h Volume",
                        value: "\$ ${coin.volume24h.toStringAsFixed(2)}",
                      ),
                      rowCrypto(
                        isDark: isDark,
                        textDescribe: "Available Supply",
                        value:
                            "${coin.availableSupply.toStringAsFixed(2)} ${coin.name}",
                      ),
                      rowCrypto(
                        isDark: isDark,
                        textDescribe: "% change 1h",
                        value: "${coin.changePct1h.toStringAsFixed(2)} %",
                        colorValue: coin.changePct1h >= 0 ? green : red,
                      ),
                      rowCrypto(
                        isDark: isDark,
                        textDescribe: "% change 1d",
                        value: "${coin.changePct24h.toStringAsFixed(2)} %",
                        colorValue: coin.changePct24h >= 0 ? green : red,
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (state is CryptoError) {
      return errorCrytoWidget(context);
    }
  }

  Widget rowCrypto({
    @required bool isDark,
    @required String textDescribe,
    @required String value,
    Color colorValue = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15.0,
        left: 15.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Row(
        children: [
          Text(
            textDescribe,
            style: TextStyle(color: (isDark) ? white : black),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(color: colorValue),
          ),
        ],
      ),
    );
  }
}
