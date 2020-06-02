import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc.dart';
import '../controller/variables.dart';

Widget cryptoLoadedWidget(BuildContext context, CryptoLoaded state) {

  //variable
  final _scrollController = ScrollController();

  //function update scroll
  bool _onScrollNotification(ScrollNotification notif, CryptoLoaded state) {

    // bottom page
    if (notif is ScrollEndNotification && _scrollController.position.extentAfter == 0) {
      context.bloc<CryptoBloc>().add(LoadMoreCoins(coins: state.coins));
    }
    return false;
  }


  return RefreshIndicator(
    color: Theme.of(context).accentColor,
    onRefresh: () async {
      context.bloc<CryptoBloc>().add(RefreshCoins());
    },
    child: NotificationListener<ScrollNotification>(
      onNotification: (notification) =>
          _onScrollNotification(notification, state),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: state.coins.length,
        itemBuilder: (BuildContext context, int index) {
          final coin = state.coins[index];
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
            title: Row(
              children: [
                Image.network("https://www.cryptocompare.com${coin.imageURL}", scale: 10),
                Text(
                  coin.fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: fontApp,
                  ),
                ),
              ],
            ),
            subtitle: Text(
              coin.name,
              style: TextStyle(
                color: Colors.white70,
                fontFamily: fontApp,
              ),
            ),
            trailing: Column(
              children: [
                Text(
                  "${coin.price.toString()}",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: fontApp,
                  ),
                ),
                Text(
                  "${coin.changePct24h.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: coin.changePct24h>=0 ? green : red,
                    fontWeight: FontWeight.w600,
                    fontFamily: fontApp,
                  ),
                )
              ],
            ),
          );
        },
      ),
    ),
  );
}
