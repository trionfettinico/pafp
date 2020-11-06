import 'package:flutter/material.dart';
import 'package:pafp/allenatore/calendario.dart';
import 'package:pafp/allenatore/impostazioni.dart';
import 'package:pafp/allenatore/lista_allievi.dart';
import 'package:pafp/allenatore/note.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedItemIndex=0;
  final List pages = [
    ListaAllieviPage(),
    NotePage(),
    CalendarioPage(),
    ImpostazioniPage(),
  ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      bottomNavigationBar:Row(
        children: <Widget>[
          buildNavBarItem(Icons.badge,0),
          buildNavBarItem(Icons.assignment,1),
          buildNavBarItem(Icons.calendar_today,2),
          buildNavBarItem(Icons.settings,3),
        ],
      ),
      body: pages[_selectedItemIndex],
    );
  }

  Widget buildNavBarItem(IconData icon,int index)
  {
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width/4,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Icon(
            icon,
            color: index == _selectedItemIndex ? Colors.white : Colors.black
        ),
      ),
    );
  }
}