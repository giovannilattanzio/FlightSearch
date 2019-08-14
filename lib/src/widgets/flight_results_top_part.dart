import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/utils/widgets/inherited_flight_listing.dart';
import 'package:flight_search/src/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flight_search/src/blocs/app_bloc.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';

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
    final _appBloc = BlocProvider.of<AppBloc>(context);

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
                  StreamBuilder(
                    stream: _appBloc.fromLocation,
                    initialData: "Nessuna selezione",
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return Text(
                        snapshot.data,
                        style: MyTheme.cityStartingSearchStyle(context),
                      );
                    },
                  ),
                  Divider(
                    height: 20.0,
                    color: Colors.grey,
                  ),
                  StreamBuilder(
                    stream: _appBloc.toLocation,
                    initialData: "Nessuna selezione",
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return Text(
                        snapshot.data,
                        style: MyTheme.cityArrivingSearchStyle(context),
                      );
                    },
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
