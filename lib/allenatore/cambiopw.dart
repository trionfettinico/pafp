import 'package:flutter/material.dart';

class CambioPwPage extends StatefulWidget {
  @override
  _CambioPwPageState createState() => _CambioPwPageState();
}

class _CambioPwPageState extends State<CambioPwPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Cambio password"),
      ),
      body: _ContainerCambioPw(context),
    );
  }

  String ValidateNewPassword(String value)
  {
    if(value.isEmpty)
    {
      return 'il campo non può essere vuoto';
    }
  }

  String ValidateNewConfPassword(String value)
  {
    if(value.isEmpty)
    {
      return 'il campo non può essere vuoto';
    }
  }


  Widget _ContainerCambioPw(BuildContext context)
  {
      return Container(
        margin: EdgeInsets.all(16), // setto i margini
        alignment: Alignment.center,
        child:Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              new TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      hintText: 'Password attuale',
                      fillColor:
                      Colors.white, //colore sfondo input email e password
                      filled: true)),
              SizedBox(
                height: 20,
              ),
              new TextFormField(
                  obscureText: true,
                  validator: ValidateNewPassword,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      hintText: 'Nuova password',
                      fillColor:
                      Colors.white, //colore sfondo input email e password
                      filled: true)),
              SizedBox(
                height: 20,
              ),
              new TextFormField(
                  obscureText: true,
                  validator: ValidateNewConfPassword,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      hintText: 'Conferma nuova password',
                      fillColor:
                      Colors.white, //colore sfondo input email e password
                      filled: true)
              ),
              SizedBox(
                height: 30,
              ),
              new SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.blue,
                  onPressed: (){

                  },
                  child: Text("Cambia Password", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      );
  }
}