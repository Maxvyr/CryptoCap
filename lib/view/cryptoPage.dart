import 'package:flutter/material.dart';
import '../repositories/cryptoRepository.dart';
import '../controller/routes.dart';
import '../controller/variables.dart';
import '../view/containerMain.dart';
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

  @override
  void initState() {
    super.initState();
    int _index = indexCrypto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomMain(context, cryptoPage),
      body: ContainerMain(
        Center(
          child: FutureBuilder(
            future: _cryptoRepository.getTopCoins(page: _page),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return cryptoLoadingWidget(context);
              }
              final List<Coin> coins = snapshot.data;
              return ListView.builder(
                itemCount: coins.length,
                itemBuilder: (BuildContext context, int index) {
                  final coin = coins[index];
                  return ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${++index}',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      coin.fullName,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      coin.name,
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: Text(
                      '\$${coin.price.toStringAsFixed(4)}',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
