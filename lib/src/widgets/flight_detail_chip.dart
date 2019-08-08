import 'package:flutter/material.dart';
import 'package:flight_search/src/utils/theme.dart';

class FlightDetailChip extends StatelessWidget {
  final IconData icon;
  final String label;

  FlightDetailChip({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
      ),
      backgroundColor: MyTheme.flightDetailChipBackgroundColor,
      avatar: Icon(
        icon,
        size: 14.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(9.0)),
      ),
    );
  }
}
