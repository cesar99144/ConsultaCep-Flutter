import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io';
import 'carregar.dart';
import 'package:consulta_cep/cep/PaginaInicial.dart';

class SplashHome extends StatefulWidget {
  @override
  _SplashHome createState() => _SplashHome();
}

class _SplashHome extends State<SplashHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.carregamento();
  }

  void carregamento() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PaginaInicial()));
    });
  }

  final String texto = "Consulta cep";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(84, 183, 218, 0.8),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 60, bottom: 20),
                    height: 100,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    texto,
                    style: TextStyle(
                      fontFamily: 'impact',
                      fontSize: 45,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //loading do splash
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CarregamentoLoading(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
