import 'package:flutter/material.dart';
import 'package:pafp/login/services/auth.dart';
import 'log_in.dart';
import 'package:pafp/database/database.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final AuthService auth = AuthService();
  final DatabaseService db = DatabaseService();
  String _username;
  String _email;
  String _password;
  String _confpassword;
  String _risreg;    //variabile che contiene la risposta del servizio relativo alla registrazione
  String _risusername;
  String _risemail;

  String ValidateUsername(String value)
  {
      if(value.isEmpty)
      {
        return 'il campo non può essere vuoto';
      }

      //funzione ws nico
      getTypeAccountUsername(value);
      if(_risusername=='allievo' || _risusername=='allenatore')
      {
        return 'username già utilizzato';
      }

  }

  String ValidateEmail(String value)
  {
    if (value.isEmpty) {
      return 'Il campo non può essere vuoto';
    }

    if (!RegExp(
        "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
        .hasMatch(value)) {
      return 'Immetti un email valida';
    }

    //funzione ws nico
    getTypeAccountEmail(value);
    if(_risemail=='allievo' || _risemail=='allenatore')
    {
      return 'email già utilizzata';
    }

  }

  String ValidatePassword(String value)
  {
    if (value.isEmpty) {
      return 'Il campo non può essere vuoto';
    }
    if(value.length<6)
    {
      return 'Mettere una password che superi i 6 caratteri';
    }
  }

  String ValidateConfPassword(String value)
  {
    if (value.isEmpty) {
      return 'Il campo non può essere vuoto';
    }
    if (value != _pass.text) {
      return 'La password di conferma non corrisponde';
    }
  }

  /*void Register() async {
    await auth.createUserAllievo(_username, _email, _password);
  }*/

  Future<void> Register(String username,String email,String password) async {
    String ris = await auth.createUserAllievo(username, email, password);
    _risreg = ris;
  }

  Future<void> getTypeAccountUsername(String username) async {
    String ris = await db.getTypeAccountUsername(username);
    //print(ris);
    _risusername = ris;
  }

  Future<void> getTypeAccountEmail(String email) async {
    String ris = await db.getTypeAccountEmail(email);
    //print(ris);
    _risemail = ris;
  }

  Widget _fieldWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextFormField(
              obscureText: false,
              validator: ValidateUsername,
              onSaved: (String value) {
                _username = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: 'Username',
                  fillColor:
                      Colors.white, //colore sfondo input email e password
                  filled: true)),
          SizedBox(
            height: 20,
          ),
          new TextFormField(
              obscureText: false,
              validator: ValidateEmail,
              onSaved: (String value) {
                _email = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: 'Email',
                  fillColor:
                      Colors.white, //colore sfondo input email e password
                  filled: true)),
          SizedBox(
            height: 20,
          ),
          new TextFormField(
              controller: _pass,
              obscureText: true,
              validator: ValidatePassword,
              onSaved: (String value) {
                _password = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: 'Password',
                  fillColor:
                      Colors.white, //colore sfondo input email e password
                  filled: true)),
          SizedBox(
            height: 20,
          ),
          new TextFormField(
              obscureText: true,
              validator: ValidateConfPassword,
              onSaved: (String value) {
                _confpassword = value;
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: 'Conferma Password',
                  fillColor:
                      Colors.white, //colore sfondo input email e password
                  filled: true)),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: SizedBox(
        width: 300,
        height: 50,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.blue,
          onPressed: () {
            if (!_formKey.currentState.validate()) {
              return;
            }
            _formKey.currentState.save(); //salvo il valore degli input text nelle variabili

            print(_username);
            print(_email);
            print(_password);
            print(_confpassword);

            Register(_username,_email,_password);
            print(_risreg);
            if(_risreg=='OK')
            {
                //ALLIEVO INSERITO
                //MENU NAVIGATOR CHE ANDRA' NEL MENU ALLIEVO

            }

          },
          child: Text("Registrati",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }


  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hai già un account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 60),
                    //_title(),
                    SizedBox(
                      height: 5,
                    ),
                    _fieldWidget(),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _submitButton(),
                    _loginAccountLabel(),
                  ])),
        ),
      ),
    );
  }
}
