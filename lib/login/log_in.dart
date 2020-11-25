import 'package:flutter/material.dart';
import 'package:pafp/login/services/auth.dart';
import 'package:pafp/database/database.dart';
import 'package:pafp/signin/sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LogIn createState() => _LogIn();
}

class _LogIn extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  final TextEditingController email = TextEditingController();
  final AuthService auth = AuthService();
  final DatabaseService db = DatabaseService();

  String checkEmail; //variabile utilizzata per validator username
  String checkPass;
  String _email;
  String _password;
  String
      _risreg; //variabile che contiene la risposta del servizio relativo alla registrazione

  Future<void> ValidateEmail(String value) async {
    if (value.isEmpty) {
      checkEmail = 'Il campo non può essere vuoto';
      return;
    }

    if (!RegExp(
            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
        .hasMatch(value)) {
      checkEmail = 'Immetti un email valida';
      return;
    }
    checkEmail = null;
  }

  Future<void> ValidatePassword(String value) async {
    if (value.isEmpty) {
      checkPass = 'Il campo non può essere vuoto';
      return;
    }
    if (value.length < 6) {
      checkPass = 'Mettere una password che superi i 6 caratteri';
      return;
    }
    checkPass = null;
  }

  Future<void> LogIn(String email, String password) async {
    _risreg = await auth.signIn(_email, _password);
  }

  Widget _fieldWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextFormField(
              obscureText: false,
              controller: email,
              validator: (value) {
                return checkEmail;
              },
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
              controller: pass,
              obscureText: true,
              validator: (value) {
                return checkPass;
              },
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
          onPressed: () async {
            await ValidateEmail(email.text);
            await ValidatePassword(pass.text);

            if (!_formKey.currentState.validate()) {
              return;
            }
            _formKey.currentState
                .save(); //salvo il valore degli input text nelle variabili
            await LogIn(_email, _password);
            print(_email);
            print(_password);
            print(_risreg);
            if (_risreg == 'OK') {
              //ALLIEVO INSERITO gli passo username
              //MENU NAVIGATOR CHE ANDRA' NEL MENU ALLIEVO
            } else {
              showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                        title: new Text("c'è un problema"),
                        content: new Text("email o password sono errate"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Close me!'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ));
            }
          },
          child: Text("Log In",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _SignInAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
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
              'Registrati',
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

  Widget _icon() {
    return Container(
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/icon.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _icon(),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 5,
                    ),
                    _fieldWidget(),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _submitButton(),
                    _SignInAccountLabel(),
                  ])),
        ),
      ),
    );
  }
}
