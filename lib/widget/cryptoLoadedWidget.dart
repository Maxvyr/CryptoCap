import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc.dart';
import '../controller/variables.dart';
import '../controller/routes.dart';

// ignore: must_be_immutable
class ListCrypto extends StatefulWidget {
  var state;

  ListCrypto(state,) {
    this.state = state;
  }

  @override
  _ListCryptoState createState() => _ListCryptoState();
}

class _ListCryptoState extends State<ListCrypto> {
  //variable
  final _scrollController = ScrollController();

  //function update scroll
  bool _onScrollNotification(ScrollNotification notif, CryptoLoaded state) {
    // bottom page
    if (notif is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      context.bloc<CryptoBloc>().add(LoadMoreCoins(coins: state.coins));
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme
          .of(context)
          .accentColor,
      onRefresh: () async {
        context.bloc<CryptoBloc>().add(RefreshCoins());
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) =>
            _onScrollNotification(notification, this.widget.state),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
          controller: _scrollController,
          itemCount: this.widget.state.coins.length,

          // separation
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 5.0),

          // container
          itemBuilder: (BuildContext context, int index) {
            final coin = this.widget.state.coins[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      white,
                      Colors.white70,
                    ],
                  ),
                ),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                          "https://www.cryptocompare.com${coin.imageURL}",
                          scale: 10),
                    ],
                  ),
                  title: Row(
                    children: [
                      Flexible(
                        child: Text(
                          coin.fullName,
                          style: TextStyle(
                            color: black,
                            fontFamily: fontApp,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    coin.name,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: fontApp,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$${coin.price.toStringAsFixed(4)}",
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .accentColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: fontApp,
                        ),
                      ),
                      Text(
                        "${coin.changePct24h.toStringAsFixed(2)} %",
                        style: TextStyle(
                          color: coin.changePct24h >= 0 ? green : red,
                          fontSize: 18.0,
                          fontFamily: fontApp,
                        ),
                      )
                    ],
                  ),
                  onTap: () => _callPage(index, coin.fullName),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _callPage(int index, String nameCrypto) {
    indexCrypto = index;
    nameCryptoClick = nameCrypto;
    Navigator.pushNamed(context, cryptoPage);
  }
}
