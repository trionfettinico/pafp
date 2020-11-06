import 'package:flutter/material.dart';

class ListaAllieviPage extends StatefulWidget
{
  @override
  _ListaAllieviPageState createState() => _ListaAllieviPageState();
}

class _ListaAllieviPageState extends State<ListaAllieviPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Lista Allievi"),
          automaticallyImplyLeading: false // rimuove il pulsante di ritorno
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Allievo 1'),
          ),
          ListTile(
            title: Text('Allievo 2'),
          ),
          ListTile(
            title: Text('Allievo 3'),
          ),
        ],
      ),
    );
  }
}