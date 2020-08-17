import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = 'R\$ 0';

  void _atualizar() async {
    String url = 'https://blockchain.info/ticker';

    http.Response response = await http.get(url);

    Map<String, dynamic> obj = json.decode(response.body);

    setState(() {
      _preco = '${obj['BRL']['symbol']}  ${obj['BRL']['buy']}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('images/bitcoin.png'),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              _preco,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35),
            ),
          ),
          RaisedButton(
            child: Text(
              'Atualizar',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: _atualizar,
            color: Colors.orange,
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
          )
        ],
      ),
    ));
  }
}
