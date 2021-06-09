import 'package:flutter/material.dart';
import 'package:solar_app/config/palette.dart';
import 'package:solar_app/screens/Notificiations.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      // leading:IconButton(
      //   icon: const Icon(Icons.menu),
      //   iconSize: 28.0,
      //   onPressed: (){},
      // ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none),
          iconSize: 28.0,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PredectionScreen()));
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
