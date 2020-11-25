import 'package:flutter/material.dart';

class AggiungiAllievoPage extends StatefulWidget {
  @override
  _AggiungiAllievoPageState createState() => _AggiungiAllievoPageState();
}

class _AggiungiAllievoPageState extends State<AggiungiAllievoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aggiungi allievo'),
      ),
      body: _bodyAggiungiAllievo(context),
    );
  }

  Widget _bodyAggiungiAllievo(BuildContext context)
  {
    return Container(
      alignment: Alignment.center,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          new TextFormField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: 'Username',
                  fillColor: Colors.white, filled: true)
          ),
          SizedBox(
            width: 170,
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              color: Colors.green,
              child: Row(
                children: <Widget>[
                  Icon(Icons.upload_file,color: Colors.white,),
                  Text('Carica scheda',style: TextStyle(fontSize: 17,color: Colors.white)),
                ],
              ),
              onPressed: (){

              },
            ),
          ),
        ],
      ),
    );
  }

}