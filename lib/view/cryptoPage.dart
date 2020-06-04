import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _index = indexCrypto;
    _cryptoName = nameCryptoClick;
  }

  @override
  Widget build(BuildContext context) {

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
              // si pas de données alors affichage cercle de recherche
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
                    Text(
                      coin.name,
                      style: TextStyle(color: black),
                    ),
                    Text(
                      '\$${coin.price.toStringAsFixed(4)}',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
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
}
