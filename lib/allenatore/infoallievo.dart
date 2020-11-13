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
          title: Text('Allievo 1'),
      ),
      body: _bodyInfoAllievo(context),
    );
  }

  Widget _bodyInfoAllievo(BuildContext context)
  {
    return Container(
        alignment: Alignment.center,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 160,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                color: Colors.green,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add,color: Colors.white,),
                    Text('Crea scheda',style: TextStyle(fontSize: 17,color: Colors.white)),
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