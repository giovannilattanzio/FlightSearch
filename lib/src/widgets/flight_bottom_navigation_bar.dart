import 'package:flutter/material.dart';

class FlightBottomNavigationBar extends StatefulWidget {
  @override
  _FlightBottomNavigationBarState createState() => _FlightBottomNavigationBarState();
}

class _FlightBottomNavigationBarState extends State<FlightBottomNavigationBar> {

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text("Home"),
          activeIcon: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: Text("Lista desideri"),
          activeIcon: Icon(
            Icons.favorite,
            color: Theme.of(context).primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_offer,
            color: Colors.black,
          ),
          title: Text("Offerte"),
          activeIcon: Icon(
            Icons.local_offer,
            color: Theme.of(context).primaryColor,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          title: Text("Notifiche"),
          activeIcon: Icon(
            Icons.notifications,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
