import 'package:flutter/material.dart';

class ImpostazioniPage extends StatefulWidget {
  @override
  _ImpostazioniPageState createState() => _ImpostazioniPageState();
}

class _ImpostazioniPageState extends State<ImpostazioniPage> {

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Impostazioni"),
          automaticallyImplyLeading: false // rimuove il pulsante di ritorno
      ),
    );
  }
}