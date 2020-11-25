import 'package:flutter/material.dart';
import 'package:pafp/allenatore/infoallievo.dart';

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
          automaticallyImplyLeading: false, // rimuove il pulsante di ritorno
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add,
                    size: 26.0,
                    color: Colors.white,
                  ),
                )
            ),
          ],
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Allievo 1'),
              trailing:Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => InfoAllievoPage()));
              },
            ),
            ListTile(
              title: Text('Allievo 2'),
            ),
            ListTile(
              title: Text('Allievo 3'),
            ),
          ]
        ).toList(),
      ),
    );
  }
}