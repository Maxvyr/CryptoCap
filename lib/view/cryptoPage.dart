import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/routes.dart';
import '../view/containerMain.dart';
import '../widget/appBarCustom.dart';
import '../blocs/bloc.dart';

class CryptoPage extends StatefulWidget {
  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomMain(context,cryptoPage),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          return ContainerMain(null);
        },
      ),
    );
  }
}
