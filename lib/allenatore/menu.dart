import 'package:flutter/material.dart';
import 'package:pafp/allenatore/calendario.dart';
import 'package:pafp/allenatore/impostazioni.dart';
import 'package:pafp/allenatore/lista_allievi.dart';
import 'package:pafp/allenatore/chat.dart';

class MenuPageAllenatore extends StatefulWidget {
  final String email;
  MenuPageAllenatore({Key key, @required this.email}) : super(key: key);
  @override
  _MenuPageState createState() => _MenuPageState(email);
}

class _MenuPageState extends State<MenuPageAllenatore> {
  String email;
  _MenuPageState(this.email);
  int _selectedItemIndex = 0;
  final List pages = [
    ListaAllieviPage(),
    ChatPage(),
    CalendarioPage(),
    ImpostazioniPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.badge, 0),
          buildNavBarItem(Icons.chat, 1),
          buildNavBarItem(Icons.calendar_today, 2),
          buildNavBarItem(Icons.settings, 3),
        ],
      ),
      body: pages[_selectedItemIndex],
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Icon(icon,
            color: index == _selectedItemIndex ? Colors.white : Colors.black),
      ),
    );
  }
}
