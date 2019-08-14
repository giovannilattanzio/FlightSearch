import 'package:flutter/material.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/blocs/flight_results_bloc.dart';
import 'package:flight_search/src/widgets/flight_results_top_part.dart';
import 'package:flight_search/src/widgets/flight_results_bottom_part.dart';

class FlightResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: FlightResultsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Risultati della ricerca",
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            FlightResultsTopPart(),
            Expanded(child: FlightResultsBottomPart()),
          ],
        ),
      ),
    );
  }
}
