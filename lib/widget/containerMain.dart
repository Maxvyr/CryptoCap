import 'package:flutter/material.dart';
import '../controller/variables.dart';

class ContainerMain extends Container {
  ContainerMain(
      dynamic widget,
      ) : super (
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
      child: widget,
  );
}