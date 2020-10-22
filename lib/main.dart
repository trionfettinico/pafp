import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firesbase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal trainer',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
