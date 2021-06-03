import 'package:flutter/material.dart';
import 'package:solar_app/widget/widgets.dart';
import 'package:solar_app/config/palette.dart';
import 'package:solar_app/widget/InputsList.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Palette.primaryColor,
      drawer: CustomNavDrawer(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildUploadFile(),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
            child: InputsList(),
              //child: CovidBarChart(covidCases:[]),

            ),) 
          
        ],
      ),
    );
  }
}
SliverToBoxAdapter _buildUploadFile() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text("Consumption of the last week :",style: TextStyle(
                color: Palette.accentColor,
                fontSize: 18,
                fontWeight: FontWeight.w300
              ),),
            ),
            ElevatedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Palette.accentColor,
                primary: Palette.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              child: Text("Upload"),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }


