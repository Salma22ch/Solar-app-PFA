import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solar_app/config/palette.dart';

class PredectionScreen extends StatefulWidget {
  const PredectionScreen({Key key}) : super(key: key);

  @override
  _PredectionScreenState createState() => _PredectionScreenState();
}

class _PredectionScreenState extends State<PredectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette.primaryColor, Palette.backgroundColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.9],
          // tileMode: TileMode.clamp
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Notifications'),
        ),
        body: Center(
          child: ListView(
            children: const <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                child: ListTile(
                  leading: Icon(Icons.notification_important_rounded),
                  title: Text(
                    'You drained your battery!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MerriWeather'),
                  ),
                  trailing: Text(
                    '10-06-2021',
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                child: ListTile(
                  leading: Icon(Icons.notification_important_sharp),
                  title: Text(
                    'Your battery is fully charged',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MerriWeather'),
                  ),
                  trailing: Text(
                    '10-06-2021',
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                child: ListTile(
                  leading: Icon(Icons.notification_important_sharp),
                  title: Text(
                    'You drained your battery!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MerriWeather'),
                  ),
                  trailing: Text(
                    '09-06-2021',
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                child: ListTile(
                  leading: Icon(Icons.notification_important_sharp),
                  title: Text(
                    'Your consumption is very high. Switch to batteries',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MerriWeather'),
                  ),
                  trailing: Text(
                    '08-06-2021',
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                child: ListTile(
                  leading: Icon(Icons.notification_important_sharp),
                  title: Text(
                    'Your Batteries were fully charged.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MerriWeather'),
                  ),
                  trailing: Text(
                    '08-06-2021',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
