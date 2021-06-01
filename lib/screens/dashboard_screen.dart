import 'package:flutter/material.dart';
import 'package:solar_app/widget/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomNavDrawer(),
      body:CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[],
      ),
    );
  }
}
