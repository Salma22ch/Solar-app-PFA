import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_app/screens/authentification/authentification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:solar_app/screens/screens.dart';

import 'BloC/bloc/consumptionBloc/consumption_bloc.dart';
import 'BloC/bloc/screenindex_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Widget page = GetStarted();
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        page = BottomNavScreen();
      });
    } else {
      setState(() {
        page = GetStarted();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final indexingBloc = ScreenindexBloc();

    return MultiBlocProvider(
        providers: [
          BlocProvider<ScreenindexBloc>(create: (context) => indexingBloc),
          BlocProvider<ConsumptionBloc>(
            create: (context) {
              return ConsumptionBloc();
            },
          ),
        ],
        child: MaterialApp(
          title: 'Solar energy application',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: Color(0xff002456),
            accentColor: Color(0xFFF2BE54),
            backgroundColor: Colors.white,

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
          home: page,
        ));
  }
}
