import 'package:flutter/material.dart';
import 'package:solar_app/config/palette.dart';
import 'package:solar_app/screens/authentification/custom_route.dart';
import 'package:solar_app/screens/authentification/login.dart';

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
                            Icon(Icons.analytics, color: Palette.accentColor),
                        title: Text(
                          'Dashboard',
                          style: _styleOfListTile(),
                        ),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(Icons.batch_prediction,
                            color: Palette.accentColor),
                        title: Text(
                          'Predictions',
                          style: _styleOfListTile(),
                        ),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(Icons.adjust,
                            color: Palette.accentColor),
                        title: Text(
                          'Inputs',
                          style: _styleOfListTile(),
                        ),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Palette.accentColor,
                        ),
                        title: GestureDetector(
                          child: Text(
                            'Logout',
                            style: _styleOfListTile(),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(new MyCustomRoute(builder: (context) => Login()));
                          },
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
                          Icon(Icons.settings, color: Palette.accentColor),
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
                  color: Palette.accentColor),
            ),
          )
        ],
      ),
    );
  }
}
