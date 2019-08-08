import 'package:flutter/material.dart';

class MyTheme {

  static const Color clipperFirstColor = Color(0xFFF47D15);
  static const Color clipperSecondColor = Color(0xFFEF772C);
  static const Color flightCardDiscountBackgroundColor = Color(0xFFFFF0E9);
  static const Color flightCardBorderColor = Color(0xFFE6E6E6);
  static const Color flightDetailChipBackgroundColor = Color(0xFFF6F6F6);

  static TextStyle dropDownLabelStyle(BuildContext context) => TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  );

  static TextStyle dropDownMenuItemStyle(BuildContext context) => TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  );

  static TextStyle viewAllStyle(BuildContext context) => TextStyle(
    color: Theme.of(context).primaryColor,
    fontSize: 14.0,
  );

  static TextStyle cityCardNameStyle(BuildContext context) => TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle cityCardMonthYearStyle(BuildContext context) => TextStyle(
    color: Colors.white,
    fontSize: 14.0,
  );

  static TextStyle cityCardDiscountStyle(BuildContext context) => TextStyle(
    color: Colors.black,
    fontSize: 14.0,
  );

  static TextStyle cityCardNewPriceStyle(BuildContext context) => TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle cityCardOldPriceStyle(BuildContext context) => TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
  );

  static TextStyle cityStartingSearchStyle(BuildContext context) => TextStyle(
    fontSize: 16.0,
  );

  static TextStyle cityArrivingSearchStyle(BuildContext context) => TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle flightCardNewPriceStyle(BuildContext context) => TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle flightCardOldPriceStyle(BuildContext context) => TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.lineThrough,
    color: Colors.grey,
  );

}