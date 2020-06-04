import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../repositories/cryptoRepository.dart';
import '../controller/routes.dart';
import '../controller/variables.dart';
import '../widget/containerMain.dart';
import '../widget/cryptoLoadingWidget.dart';
import '../widget/appBarCustom.dart';
import '../widget/coinModel.dart';

class CryptoPage extends StatefulWidget {
  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  final _cryptoRepository = CryptoRepository();
  int _page = 0;
  int _index = 0;
  String _cryptoName;
  String _urlBuyCrypto =
      "https://www.coinbase.com/join/vidali_e?src=android-link";

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

    return Scaffold(
      appBar: AppBarCustomMain(
        context: context,
        page: cryptoPage,
        title: _cryptoName,
      ),
      body: ContainerMain(
        Center(
          child: FutureBuilder(
            future: _cryptoRepository.getTopCoins(page: _page),
            builder: (context, snapshot) {
              // si pas de donnée alors affichage cercle de recherche
              if (!snapshot.hasData) {
                return cryptoLoadingWidget(context);
              }
              /*
                stock les coin dans un list et
                l'index de cette liste est l'index qui correspond au click de l'utilisateur
                ceci permet d'afficher des détails de la crypto
              */
              final List<Coin> coins = snapshot.data;
              final coin = coins[_index];
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // graph
                    ClipRRect(
                      borderRadius: BorderRadius.circular(55.0),
                      child: Image.network("https://picsum.photos/400"),
                    ),

                    // Button Buy crypto - Coinbase
                    RaisedButton(
                      onPressed: () {
                        launch(_urlBuyCrypto);
                      },
                      elevation: 8.0,
                      color: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
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
                                  blurRadius: 8.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //bloc data crypto
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35.0),
                      child: Container(
                        color: white,
                        width: screen.size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(height: 5.0),
                            rowCrypto(
                              textDescribe: "Market Cap",
                              value: "\$ ${coin.marketCapCrypto}",
                            ),
                            rowCrypto(
                              textDescribe: "24h Volume",
                              value: "\$ ${coin.volume24h.toStringAsFixed(2)}",
                            ),
                            rowCrypto(
                              textDescribe: "Available Supply",
                              value:
                                  "${coin.availableSupply.toStringAsFixed(2)} ${coin.name}",
                            ),
                            rowCrypto(
                              textDescribe: "% change 1h",
                              value: "${coin.changePct1h.toStringAsFixed(2)} %",
                              colorValue: coin.changePct1h >= 0 ? green : red,
                            ),
                            rowCrypto(
                              textDescribe: "% change 1d",
                              value:
                                  "${coin.changePct24h.toStringAsFixed(2)} %",
                              colorValue: coin.changePct24h >= 0 ? green : red,
                            ),
                            SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget rowCrypto({
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
            style: TextStyle(color: black),
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
