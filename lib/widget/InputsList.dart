import 'package:flutter/material.dart';
import 'package:solar_app/config/palette.dart';

class InputsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Palette.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'System Configuration',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: ListView(
            children: [
              ListTile(
                title: Text('Battery'),
                leading: Image.asset("battery.png"),
                onTap: () {
                  showDialog<void>(context: context, builder: (context) => SimpleDialog(
                              title: Text('Battery Configuration', style: const TextStyle(
                              fontSize: 16,
                            ),),
                     children: [
                       
                       ],
                     ),
                    );             
                      },
                ),
              ListTile(
                title: Text('Solar Panels'),
                leading: Image.asset("solar-panel.png"),
                onTap: () {
                  showDialog<void>(context: context, builder: (context) => SimpleDialog(
                              title: Text('Solar Panels Configuration', style: const TextStyle(
                              fontSize: 16,
                            ),),
                     children: [
                       
                       ],
                     ),
                    );             
                      },
              ),
              ListTile(
                title: Text('Hyperparameters'),
                leading: Image.asset("hyperparameters.png"),
                onTap: () {
                  showDialog<void>(context: context, builder: (context) => SimpleDialog(
                              title: Text('Hyperparameters Configuration', style: const TextStyle(
                              fontSize: 16,
                            ),),
                     children: [
                       
                       ],
                     ),
                    );             
                      },
              )
              ],
              ),
            )
        ],
    ));
  }
}
