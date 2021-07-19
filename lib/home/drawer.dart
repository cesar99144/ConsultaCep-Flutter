import 'package:flutter/material.dart';
import 'dart:io';
import 'sobre.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer();
  @override
  _CustomDrawer createState() => _CustomDrawer();
}

class _CustomDrawer extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Olá, bem vindo(a)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            decoration: BoxDecoration(
              color: Color.fromRGBO(56, 128, 255, 0.9),
            ),
          ),
          ListTile(
            //leading: Icon(Icons.person),
            title: Text(
              "Avaliar o app",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Sobre",
              style: TextStyle(fontFamily: 'KGred', fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sobre()));
            },
          ),
        ],
      ),
    );
  }
}
