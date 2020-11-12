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
      body: SingleChildScrollView(
        child:Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading:Icon(Icons.lock_outline,color: Colors.blue,),
                    title:Text("Cambia password"),
                    trailing:Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
                    onTap: (){
                      // indirizzamento verso pagina cambio password

                    },
                  ),
                  ListTile(
                    leading:Icon(Icons.notifications,color: Colors.blue,),
                    title:Text("Notifiche"),
                    trailing:Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
                    onTap: (){
                      // indirizzamento verso pagina cambio password

                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.blue,
                  ),
                  ListTile(
                    //leading:Icon(Icons.notifications,color: Colors.blue,),
                    title:Text("Disconnetti account",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                    //trailing:Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
                    onTap: (){
                      // disconnessione account e reindirizzamento a pagina iniziale

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