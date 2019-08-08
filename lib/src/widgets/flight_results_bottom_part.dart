import 'package:flutter/material.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/widgets/flight_card.dart';

class FlightResultsBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Migliori offerte per i prossimi 6 mesi",
                style: MyTheme.dropDownMenuItemStyle(context),
              ),
            ),
            Container(
              height: 10.0,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  FlightCard(),
                  FlightCard(),
                  FlightCard(),
                  FlightCard(),
                  FlightCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
