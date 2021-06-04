import 'package:flutter/material.dart';
import 'package:solar_app/config/palette.dart';

class CustomNavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0), bottomRight: Radius.circular(30)),
        child: Drawer(
          child: Container(
              color: Palette.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _drawerHeader(),
                  SizedBox(height: 40,),
                  Column(
                    children: [
                      ListTile(
                        leading:
                            Icon(Icons.analytics, color: Palette.backgroundColor),
                        title: Text(
                          'Dashboard',
                          style: _styleOfListTile(),
                        ),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(Icons.batch_prediction,
                            color: Palette.backgroundColor),
                        title: Text(
                          'Predictions',
                          style: _styleOfListTile(),
                        ),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(Icons.adjust,
                            color: Palette.backgroundColor),
                        title: Text(
                          'Inputs',
                          style: _styleOfListTile(),
                        ),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Palette.backgroundColor,
                        ),
                        title: Text(
                          'Logout',
                          style: _styleOfListTile(),
                        ),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0, left: 40),
                    child: ListTile(
                      leading:
                          Icon(Icons.settings, color: Palette.backgroundColor),
                      title: Text(
                        'Settings',
                        style: _styleOfListTile(fontWeight: FontWeight.w200),
                      ),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  TextStyle _styleOfListTile({FontWeight fontWeight=FontWeight.w300}) {
    return TextStyle(
        fontSize: 20,
        fontWeight: fontWeight,
        color: Palette.backgroundColor);
  }

  DrawerHeader _drawerHeader() {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.brown.shade800,
            child: const Text('Me'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Name Name",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Palette.backgroundColor),
            ),
          )
        ],
      ),
    );
  }
}
