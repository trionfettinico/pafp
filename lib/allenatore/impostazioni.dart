import 'package:flutter/material.dart';
import 'package:pafp/allenatore/cambiopw.dart';

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
      body: _ListViewSetting(context),
    );
  }

  Widget _ListViewSetting(BuildContext context)
  {
      return ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading:Icon(Icons.lock_outline,color: Colors.blue,),
              title:Text("Cambia password"),
              trailing:Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
              onTap: (){
                // indirizzamento verso pagina cambio password
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CambioPwPage()));
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
            ListTile(
              title:Text("Disconnetti account",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
              onTap: (){
                // disconnessione account e reindirizzamento a pagina iniziale

              },
            ),
          ],
        ).toList(),
      );
  }
}