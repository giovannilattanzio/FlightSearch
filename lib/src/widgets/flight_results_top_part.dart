import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/utils/widgets/inherited_flight_listing.dart';
import 'package:flight_search/src/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';

class FlightResultsTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 160.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  MyTheme.clipperFirstColor,
                  MyTheme.clipperSecondColor,
                ],
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 20.0,
            ),
            _createCitiesFilter(context),
          ],
        ),
      ],
    );
  }

  Widget _createCitiesFilter(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 22.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    InheritedFlightListing.of(context).fromLocation,
                    style: MyTheme.cityStartingSearchStyle(context),
                  ),
                  Divider(
                    height: 20.0,
                    color: Colors.grey,
                  ),
                  Text(
                    InheritedFlightListing.of(context).toLocation,
                    style: MyTheme.cityArrivingSearchStyle(context),
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.import_export,
                color: Colors.black,
                size: 32.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
