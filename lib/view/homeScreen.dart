import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc.dart';
import '../controller/variables.dart';
import '../widget/appBarCustom.dart';
import '../widget/cryptoLoadedWidget.dart';
import '../widget/errorCryptoWidget.dart';
import '../widget/cryptoLoadingWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustomMain(context),
      body: SafeArea(
        child: BlocBuilder<CryptoBloc, CryptoState>(
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
      ),
    );
  }

  _buildBody(CryptoState state) {
    if (state is CryptoLoading) {
      return cryptoLoadingWidget(context);
    } else if (state is CryptoLoaded) {
      return cryptoLoadedWidget(context, state);
    } else if (state is CryptoError) {
      return errorCrytoWidget(context);
    }
  }
}
