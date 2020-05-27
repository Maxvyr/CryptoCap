import 'package:flutter/material.dart';
import '../repositories/cryptoRepository.dart';
import '../widget/appBarCustom.dart';
import '../widget/coinModel.dart';
import '../controller/variables.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cryptoRepository = CryptoRepository();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustomMain(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              blueMain,
              blueMain.withOpacity(0.3),
            ],
          ),
        ),
        child: FutureBuilder(
          future: _cryptoRepository.getTopCoins(page: _page),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).accentColor),
                ),
              );
            }
            final List<Coin> coins = snapshot.data;
            return RefreshIndicator(
              color: Theme.of(context).accentColor,
              onRefresh: () async {
                setState(() => _page = 0);
              },
              child: ListView.builder(
                itemCount: coins.length,
                itemBuilder: (BuildContext context, int index) {
                  final coin = coins[index];
                  return ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${++index}",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: fontApp,
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      coin.fullName,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontApp,
                      ),
                    ),
                    subtitle: Text(
                      coin.name,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: fontApp,
                      ),
                    ),
                    trailing: Text(
                      "\$${coin.price.toStringAsFixed(4)}",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: fontApp,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
