import 'package:flutter/material.dart';
import 'home/splashHome.dart';
import 'cep/PaginaInicial.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: SplashHome(),
    );
  }
}
