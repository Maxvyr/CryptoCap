import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/appBarCustom.dart';
import '../controller/variables.dart';
import '../blocs/bloc.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustomMain(context),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          return Container(
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
            child: _buildBody(state),
          );
        },
      ),
    );
  }

  _buildBody(CryptoState state) {
    if (state is CryptoLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      );
    } else if (state is CryptoLoaded) {
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
        ),
      );
    } else if (state is CryptoError) {
      return Center(
        child: Text(
          "Error loading coins!\nPlease check your connection",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w600,
            fontFamily: fontApp,
          ),
        ),
      );
    }
  }

  bool _onScrollNotification(ScrollNotification notif, CryptoLoaded state) {

    // bottom page
    if (notif is ScrollEndNotification && _scrollController.position.extentAfter == 0) {
      context.bloc<CryptoBloc>().add(LoadMoreCoins(coins: state.coins));
    }
    return false;
  }
}
