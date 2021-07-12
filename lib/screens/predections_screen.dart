import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_app/BloC/bloc/consumptionBloc/consumption_bloc.dart';
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
        body: BlocBuilder<ConsumptionBloc, ConsumptionState>(
          builder: (context, state) {
            if (state is ConsumptionLoaded) {
              if (isChargeBatteries(state.predictedConsumptionList[0],
                  state.predictedProductionList[0])) {
                return Center(
                    child: Column(
                  children: [
                    Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.only(
                            left: 100, right: 100, top: 100, bottom: 50),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 4, color: Palette.primaryColor)),
                        child: Image.asset("charging.png")),
                    Text(
                      "You should charge your Battery!",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.red),
                    )
                  ],
                ));
              } else {
                return Center(
                    child: Column(
                  children: [
                    Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.only(
                            left: 100, right: 100, top: 100, bottom: 50),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 4, color: Palette.primaryColor)),
                        child: Image.asset("charging.png")),
                    Text(
                      "You don't need to charge Batteries",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.green),
                    )
                  ],
                ));
              }
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                  "You did not insert your past consumption and solar production data yet!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black),
                )),
              );
            }
          },
        ),
      ),
    );
  }

  bool isChargeBatteries(
      String consumptionTomorrow, String productionTomorrow) {
    double theConsumptionTomorrow = double.parse(consumptionTomorrow);
    double theProductionTomorrow = double.parse(productionTomorrow);
    if (theConsumptionTomorrow < theProductionTomorrow) {
      return false;
    } else {
      return true;
    }
  }
}
