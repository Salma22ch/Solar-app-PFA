import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_app/BloC/bloc/consumptionBloc/consumption_bloc.dart';
import 'package:solar_app/config/palette.dart';
import 'package:solar_app/data/data.dart';
import 'package:solar_app/widget/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../NetworkHandler.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  NetworkHandler networkHandler = NetworkHandler();
  final storage = FlutterSecureStorage();
  var response, battery_state = "...";
  String userid = "loading";
  String email;
  @override
  void initState() {
    super.initState();
    getuserid();
  }

  getuserid() async {
    String token = await storage.read(key: "token");
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload["id"]);
    setState(() {
      userid = payload["id"];
    });
    response = await networkHandler.get("/api/user/" + userid);
    print(jsonDecode(response.body));
    // setState(() {
    //   battery_state =
    //       response != null ? jsonDecode(response.body)["battery"][0] : "...";
    // });
  }

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
        backgroundColor: Colors.transparent,
        body: BlocBuilder<ConsumptionBloc, ConsumptionState>(
          builder: (context, state) {
            return CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Consumption",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.backgroundColor,
                          fontSize: 25),
                    ),
                  ),
                ),
                _buildTabsOfTreeDays(),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  sliver: SliverToBoxAdapter(
                    child: StatsGrid(battery_state: battery_state),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 20),
                  sliver: SliverToBoxAdapter(
                    child: state is ConsumptionLoaded
                        ? ConsumptionBarChart(
                            consumtions: state.predictedConsumptionList
                                .map((e) => e.toString())
                                .toList())
                        : ConsumptionBarChart(
                            consumtions: ["0", "0", "0", "0", "0", "0", "0"]),
                  ),
                )
                // BlocBuilder<ConsumptionBloc, ConsumptionState>(
                //   builder: (context, state) {
                //     if (state is ConsumptionLoaded) {
                //       return SliverPadding(
                //         padding: const EdgeInsets.only(top: 20),
                //         sliver: SliverToBoxAdapter(
                //           child:
                //               //ConsumptionBarChart(consumtions: dailyConsumptionOftheWeek),
                //               ConsumptionBarChart(
                //                   consumtions: state.predictedConsumptionList),
                //         ),
                //       );
                //     } else {
                //       return Center(child: Text("MAZAL"));
                //     }
                //   },
                // ),
              ],
            );
          },
        ),
      ),
    );
  }

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
