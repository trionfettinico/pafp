import 'package:flutter/material.dart';
import 'log_in.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignInPage> {
  List<bool> isSelected = List.generate(2, (_) => false);
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.blue),
            ),
            Text('Indietro',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.blue))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),*/
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: title,
                  fillColor: Colors.white,  //colore sfondo input email e password
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.blue)
          ],
          ),
      child: Text(
        'Registrati',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _choiceButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: <Widget>[
          ToggleSwitch(
            minWidth: 150.0,
            initialLabelIndex: 0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            labels: ['Allenatore', 'Allievo'],
            activeBgColors: [Colors.blue, Colors.pink],
            onToggle: (index) {
              //print('switched to: $index');
            },
          ),
        ],
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
        margin: EdgeInsets.symmetric(vertical: 20),
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

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Email"),
        _entryField("Password", isPassword: true),
        _entryField("Conferma Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80),
                    //_title(),
                    SizedBox(
                      height: 5,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 30,
                    ),
                    _choiceButton(),
                    SizedBox(
                      height: 30,
                    ),
                    _submitButton(),
                    SizedBox(height: 5),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}