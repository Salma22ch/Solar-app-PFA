import 'package:flutter/material.dart';

class StatsGrid extends StatefulWidget {
  final String battery_state;
  const StatsGrid ({ Key key, this.battery_state }): super(key: key);
  @override
  _StatsGridState createState() => _StatsGridState(this.battery_state);
}

class _StatsGridState extends State<StatsGrid> {
  final String  battery_state;
  _StatsGridState(this.battery_state);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatCard("Consumption", "45 KWH", Colors.blue),
                (battery_state!=null)?_buildStatCard("Battery State", battery_state, Colors.red) : _buildStatCard("Battery State",  "...", Colors.red),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return (Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              count,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));
  }
}
