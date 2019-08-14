import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  CustomChoiceChip({this.icon, this.text, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 8.0,
      ),
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            )
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 20.0,
            color: Colors.white,
          ),
          Container(
            width: 6.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
