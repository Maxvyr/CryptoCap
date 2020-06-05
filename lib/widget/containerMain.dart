import 'package:flutter/material.dart';

class ContainerMain extends Container {
  ContainerMain(
      BuildContext context,
      dynamic widget,
      ) : super (
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.3),
          ],
        ),
      ),
      child: widget,
  );
}