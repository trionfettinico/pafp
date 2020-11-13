import 'package:flutter/material.dart';

class ListaSchedePage extends StatefulWidget {
  @override
  _ListaSchedePageState createState() => _ListaSchedePageState();
}

class _ListaSchedePageState extends State<ListaSchedePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Lista schede"),
          automaticallyImplyLeading: false // rimuove il pulsante di ritorno
      ),
    );
  }
}