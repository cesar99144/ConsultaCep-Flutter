import 'package:consulta_cep/cep/PaginaInicial.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaginaResultado extends StatefulWidget {
  var cep;
  var tipoEndereco;
  var enderecoNome;
  var endereco;
  var estado;
  var bairro;
  var cidade;
  var codigoMunicipio;
  var ddd;

  PaginaResultado(this.cep, this.tipoEndereco, this.enderecoNome, this.endereco,
      this.estado, this.bairro, this.cidade, this.codigoMunicipio, this.ddd);
  @override
  _PaginaResultado createState() => _PaginaResultado();
}

class _PaginaResultado extends State<PaginaResultado> {
  @override
  Widget build(BuildContext context) {
    var resultCep = '${widget.cep}';
    var resultTipoEndereco = '${widget.tipoEndereco}';
    var resultEnderecoNome = '${widget.enderecoNome}';
    var resultEndereco = '${widget.endereco}';
    var resultEstado = '${widget.estado}';
    var resultBairro = '${widget.bairro}';
    var resultCidade = '${widget.cidade}';
    var resultCodigoMunicipio = '${widget.codigoMunicipio}';
    var resultDdd = '${widget.ddd}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultado busca',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(56, 128, 255, 0.9),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Cep: ' + resultCep,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Endereço: ' + resultEndereco,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Bairro: ' + resultBairro,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Cidade: ' + resultCidade,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('UF: ' + resultEstado,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Código municipio: ' + resultCodigoMunicipio,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text('DD: ' + resultDdd,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  FlatButton(
                    padding: const EdgeInsets.all(16.0),
                    textColor: Colors.white,
                    color: Color.fromRGBO(56, 128, 255, 0.9),
                    minWidth: 300,
                    child: const Text(
                      'Compartilhar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  FlatButton(
                    padding: const EdgeInsets.all(16.0),
                    textColor: Colors.white,
                    color: Color.fromRGBO(0, 255, 255, 0.9),
                    minWidth: 300,
                    child: const Text(
                      'Voltar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => PaginaInicial()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
