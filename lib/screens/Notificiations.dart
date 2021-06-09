import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solar_app/config/palette.dart';
import 'package:solar_app/data/data.dart';

import 'package:solar_app/widget/widgets.dart';

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
          title: Text('Notifications'),
        ),
      ),
    );
  }
}
