import 'package:flutter/material.dart';
import 'package:flight_search/src/screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFF3791A),
        primarySwatch: Colors.orange,
        fontFamily: 'Oxygen',
      ),
      home: Home(),
    );
  }
}