//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioPage extends StatefulWidget {
  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Calendario"),
          automaticallyImplyLeading: false // rimuove il pulsante di ritorno
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.week, // come vista iniziale è impostata la settimana corrente
              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,
                selectedColor: Colors.blue,
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white, //colore dell numero
                ),
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color:Colors.blue,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
                formatButtonShowsNext: false, // viene mostrata solo la settimana corrente ( in vista settimanale )
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,  // lunedì come giorno di inizio settimana
              builders: CalendarBuilders(
                selectedDayBuilder: (context,date,events) =>
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(date.day.toString(),style: TextStyle(color: Colors.white),)),
                todayDayBuilder: (context,date,events) =>
                    Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(date.day.toString(),style: TextStyle(color: Colors.white),)),
              ),
              calendarController: _controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //aggiungo evento al calendario
        },
      ),
    );
  }
}