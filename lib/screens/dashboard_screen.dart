import 'package:flutter/material.dart';
import 'package:solar_app/config/palette.dart';
import 'package:solar_app/data/data.dart';
import 'package:solar_app/widget/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
        backgroundColor:Colors.transparent,
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            //_buildUploadFile(),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: Text("Consumption",style: TextStyle(fontWeight: FontWeight.bold,
                color: Palette.backgroundColor,fontSize: 25),),
              ),
            ),
            _buildTabsOfTreeDays(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: StatsGrid(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 20),
              sliver: SliverToBoxAdapter(
                child:
                    ConsumptionBarChart(consumtions: dailyConsumptionOftheWeek),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SliverToBoxAdapter _buildUploadFile() {
  //   return SliverToBoxAdapter(
  //     child: Container(
  //       padding: const EdgeInsets.all(20),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Flexible(
  //             child: Text("Upload the consumation of the week:",style: TextStyle(
  //               color: Palette.backgroundColor,
  //               fontSize: 20,
  //               fontWeight: FontWeight.w300
  //             ),),
  //           ),
  //           ElevatedButton(
  //             style: OutlinedButton.styleFrom(
  //               backgroundColor: Palette.backgroundColor,
  //               primary: Palette.primaryColor,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(12), // <-- Radius
  //               ),
  //             ),
  //             child: Text("Upload"),
  //             onPressed: (){},
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  SliverPadding _buildTabsOfTreeDays() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            //labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [Text("Yesterday"), Text("Today"), Text("Tomorrow")],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }
}
