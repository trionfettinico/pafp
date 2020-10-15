import 'package:flutter/material.dart';
import 'login/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal trainer prova 2',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
