import 'package:flutter/material.dart';
import 'package:flight_search/src/screens/home.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/blocs/app_bloc.dart';
import 'package:flight_search/src/blocs/home_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: AppBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFFF3791A),
          primarySwatch: Colors.orange,
          fontFamily: 'Oxygen',
        ),
        home: Home(),
      ),
    );
  }
}
