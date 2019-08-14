import 'package:flutter/material.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/blocs/home_bloc.dart';
import 'package:flight_search/src/widgets/home_screen_topbar.dart';
import 'package:flight_search/src/widgets/home_screen_bottom_part.dart';
import 'package:flight_search/src/widgets/flight_bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: HomeBloc(),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero, //inserito per evitare la safe area della status bar
          children: <Widget>[
            HomeScreenTopBar(),
            HomeScreenBottomPart(),
          ],
        ),
        bottomNavigationBar: FlightBottomNavigationBar(),
      ),
    );
  }
}
