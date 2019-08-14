import 'package:flutter/material.dart';
import 'package:flight_search/src/widgets/flight_detail_chip.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/utils/util.dart';
import 'package:flight_search/src/models/flight_details.dart';

class FlightCard extends StatelessWidget {

  final FlightDetails flightDetails;

  FlightCard(this.flightDetails);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          _createMainDataContainer(context),
          _createDiscountContainer(context),
        ],
      ),
    );
  }

  Widget _createMainDataContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: MyTheme.flightCardBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "${Format.formatCurrency.format(flightDetails.newPrice)}",
                  style: MyTheme.flightCardNewPriceStyle(context),
                ),
                Container(
                  width: 6.0,
                ),
                Text(
                  "(${Format.formatCurrency.format(flightDetails.oldPrice)})",
                  style: MyTheme.flightCardOldPriceStyle(context),
                ),
              ],
            ),
            Wrap(
              children: <Widget>[
                FlightDetailChip(
                  label: flightDetails.date,
                  icon: Icons.calendar_today,
                ),
                FlightDetailChip(
                  label: flightDetails.airlines,
                  icon: Icons.flight_takeoff,
                ),
                FlightDetailChip(
                  label: "${flightDetails.rating}",
                  icon: Icons.star,
                ),
              ],
              spacing: 8.0,
              runSpacing: -8.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _createDiscountContainer(BuildContext context) {
    return Positioned(
      top: 10.0,
      right: 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: Text(
          "${flightDetails.discount}%",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          color: MyTheme.flightCardDiscountBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
