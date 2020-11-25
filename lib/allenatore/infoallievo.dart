import 'package:flutter/material.dart';

class InfoAllievoPage extends StatefulWidget {
  @override
  _InfoAllievoPageState createState() => _InfoAllievoPageState();
}

class _InfoAllievoPageState extends State<InfoAllievoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Schede'),
      ),
      body: _bodyInfoAllievo(context),
    );
  }

  Widget _bodyInfoAllievo(BuildContext context)
  {
    return Container(

    );
  }

}