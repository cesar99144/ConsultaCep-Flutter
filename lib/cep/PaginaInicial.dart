import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'PaginaResultado.dart';
import '../home/drawer.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicial createState() => _PaginaInicial();
}

class _PaginaInicial extends State<PaginaInicial> {
  //Controller para armazenar os valores digitados
  final TextEditingController controllercep = TextEditingController();
  var dados;

  void buscarCep() async {
    var cep = this.controllercep.text;

    final url = Uri.parse('https://cep.awesomeapi.com.br/json/' + cep);
    final response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);

    setState(() {
      this.dados = jsonResponse;
    });

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => PaginaResultado(
            cep,
            this.dados['address_type'],
            this.dados['address_name'],
            this.dados['address'],
            this.dados['state'],
            this.dados['district'],
            this.dados['city'],
            this.dados['city_ibge'],
            this.dados['ddd'])));
  }

  void validarDados() {
    var cepInformado = this.controllercep.text;
    int tamanhoCep = cepInformado.length;
    if (cepInformado.isEmpty) {
      setState(() {
        final snackBar = SnackBar(
            content: Text('Preencha o campo de cep'),
            backgroundColor: Colors.red);
        Colors.white;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      if (tamanhoCep == 8) {
        buscarCep();
      } else {
        setState(() {
          final snackBar = SnackBar(
              content: Text('Cep deve conter 8 digitos'),
              backgroundColor: Colors.red);
          Colors.white;
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromRGBO(84, 183, 218, 0.8),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Buscar por cep',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(56, 128, 255, 0.9),
        ),
        drawer: CustomDrawer(),
        body: Card(
          margin: EdgeInsets.only(top: 100),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Informe o cep:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 60,
                width: 300,
                child: TextField(
                  controller: controllercep,
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'xx.xxx.xxx',
                    border: null,
                  ),
                ),
              ),
              FlatButton(
                padding: const EdgeInsets.all(16.0),
                textColor: Colors.white,
                color: Color.fromRGBO(56, 128, 255, 0.9),
                minWidth: 300,
                child: const Text(
                  'Consultar',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  validarDados();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
            ],
          ),
        ));
  }
}
