import 'package:flutter/material.dart';
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
        body: Center(
            child: Column(
          children: [
            Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(
                    left: 100, right: 100, top: 100, bottom: 50),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Palette.primaryColor)),
                child: Image.asset("charging.png")),
            Text(
              "You should charge your Battery!!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        )),
      ),
    );
  }
}
