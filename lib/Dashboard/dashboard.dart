import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _dashboard();
  }
}

class _dashboard extends State<dashboard> {
  int _selectedIndex = 0;
  static const TextStyle TitleStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: TitleStyle,
    ),
    Text(
      'Index 1: Business',
      style: TitleStyle,
    ),
    Text(
      'Index 2: School',
      style: TitleStyle,
    ),
  ];
  static const List<Widget> _ListOfTiltes= <Widget>[
    Text(
      'Home',
      style: TitleStyle,
    ),
    Text(
      'Business',
      style: TitleStyle,
    ),
    Text(
      'School',
      style: TitleStyle,
    ),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  _ListOfTiltes.elementAt(_selectedIndex),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).backgroundColor ,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
