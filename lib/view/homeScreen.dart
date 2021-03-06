import '../controller/routes.dart';
import '../widget/containerMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc.dart';
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
      appBar: AppBarCustomMain(
        context: context,
        page: homePage,
      ),
      body: SafeArea(
        child: BlocBuilder<CryptoBloc, CryptoState>(
          builder: (context, state) {
            return ContainerMain(
              context,
              _buildBody(state),
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
      return ListCrypto(state);
    } else if (state is CryptoError) {
      return errorCrytoWidget(context);
    }
  }
}
