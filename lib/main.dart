import 'package:solar_app/Authentification/helper/authentificate.dart';
import 'package:solar_app/Authentification/views/signin.dart';
import 'package:solar_app/Authentification/views/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar energy application',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
      //  scaffoldBackgroundColor: Color(0xff1F1F1F),
      ),
      home: Authentificate(),
    );
  }
}