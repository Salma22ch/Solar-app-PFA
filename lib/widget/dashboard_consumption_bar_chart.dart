import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:solar_app/config/palette.dart';

class ConsumptionBarChart extends StatelessWidget {
  final List<double> consumtions;

  const ConsumptionBarChart({this.consumtions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily Consumption',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              width: MediaQuery.of(context).size.width,
              child: BarChart(
                BarChartData(
                  maxY: 16,
                  barTouchData: BarTouchData(enabled: false),
                  alignment: BarChartAlignment.spaceAround,
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      rotateAngle: 35,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'May 24';
                          case 1:
                            return 'May 24';
                          case 2:
                            return 'May 24';
                          case 3:
                            return 'May 24';
                          case 4:
                            return 'May 24';
                          case 5:
                            return 'May 24';
                          case 6:
                            return 'May 24';
                          default:
                            return "";
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      margin: 10,
                      showTitles: true,
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value)=> value % 3 ==0,
                    getDrawingHorizontalLine: (value)=>FlLine(
                      color: Colors.black12,
                      strokeWidth: 1.0,
                      dashArray: [5],
                    )
                  ),
                  borderData: FlBorderData(
                    show: false
                  ),
                  barGroups: consumtions
                      .asMap()
                      .map(
                        (key, value) => MapEntry(
                          key,
                          BarChartGroupData(
                            x: key,
                            barRods: [
                              BarChartRodData(
                                y: value,
                                colors: [Palette.accentColor],
                              ),
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
                swapAnimationDuration: Duration(milliseconds: 150), // Optional
              ),
            ),
          )
        ],
      ),
    );
  }
}
