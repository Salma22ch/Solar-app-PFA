import 'package:solar_app/Authentification/helper/authentificate.dart';
import 'package:solar_app/Authentification/views/signin.dart';
import 'package:solar_app/Authentification/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:solar_app/FirstPages/getStarted.dart';

import 'Dashboard/dashboard.dart';

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

          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Color(0xff002456),
          accentColor: Color(0xFFF2BE54),
          backgroundColor :Colors.white,

          // Define the default font family.
          //fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
      //  scaffoldBackgroundColor: Color(0xff1F1F1F),
      ),
      //home: Authentificate(),
      //home: dashboard(),
      home: getStarted(),
    );
  }
}