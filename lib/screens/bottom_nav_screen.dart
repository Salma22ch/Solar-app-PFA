import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_app/BloC/bloc/screenindex_bloc.dart';
import 'package:solar_app/config/palette.dart';
import 'package:solar_app/screens/inputs_screen.dart';
import 'package:solar_app/screens/predections_screen.dart';
import 'package:solar_app/widget/widgets.dart';
import 'screens.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key key }) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final indexingBloc = ScreenindexBloc();

  final List _screens = [
    DashboardScreen(),
    PredectionScreen(),
    InputScreen(),
  ];
  int _currentIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  //   // final weatherBloc = BlocProvider.of<ScreenindexBloc>(context).add(GetIndex(index));;
  //   // // Initiate getting the weather
  //   // weatherBloc.add(GetIndex(index));
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => indexingBloc,
      child: Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomNavDrawer(),
        //body: _screens[_currentIndex],
        body: BlocBuilder(
          bloc: indexingBloc,
          builder: (context, state) {
            return _screens[state];
          },
        ),

        bottomNavigationBar: BlocBuilder(
          bloc: indexingBloc,
          builder: (context, state) {
            return BottomNavigationBar(
              items: [Icons.analytics, Icons.batch_prediction, Icons.adjust]
                  .asMap()
                  .map(
                    (key, value) => MapEntry(
                      key,
                      BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: state == key
                                ? Palette.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Icon(value),
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
              currentIndex: state,
              selectedItemColor: Palette.backgroundColor,
              unselectedItemColor: Colors.grey,
              backgroundColor: Palette.backgroundColor,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              //onTap: _onItemTapped,
              onTap: (index) => indexingBloc.add(GetIndex(index)),
            );
          },
        ),
      ),
    );
  }
}
