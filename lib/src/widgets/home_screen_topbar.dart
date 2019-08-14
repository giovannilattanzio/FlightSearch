import 'package:flight_search/src/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flight_search/src/screens/flight_results.dart';
import 'package:flight_search/src/widgets/custom_shape_clipper.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/widgets/choice_chip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/blocs/home_bloc.dart';
import 'package:flight_search/src/blocs/app_bloc.dart';

class HomeScreenTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homeBloc = BlocProvider.of<HomeBloc>(context);

    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  MyTheme.clipperFirstColor,
                  MyTheme.clipperSecondColor,
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      Container(
                        width: 16.0,
                      ),
                      _preparePopupMenuButton(context),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.0,
                ),
                Text(
                  "Dove vuoi andare?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: _createSearchField(context),
                  ),
                ),
                Container(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _homeBloc.setFlightListSelected(true);
                      },
                      child: StreamBuilder(
                        stream: _homeBloc.isFlightListSelected,
                        initialData: true,
                        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                          return CustomChoiceChip(
                            icon: Icons.flight,
                            text: "Voli",
                            isSelected: snapshot.data,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        _homeBloc.setFlightListSelected(false);
                      },
                      child: StreamBuilder(
                        stream: _homeBloc.isFlightListSelected,
                        initialData: true,
                        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                          return CustomChoiceChip(
                            icon: Icons.hotel,
                            text: "Hotel",
                            isSelected: !snapshot.data,
                          );
                        },
                      ),
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _preparePopupMenuButton(BuildContext context) {

    final _appBloc = BlocProvider.of<AppBloc>(context);

    return StreamBuilder(
      stream: _appBloc.locations,
      builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _createPopupMenuButton(context, snapshot.data);
        }
      },
    );
  }

  Widget _createPopupMenuButton(
      BuildContext context, List<DocumentSnapshot> data) {

    final _appBloc = BlocProvider.of<AppBloc>(context);

    return PopupMenuButton(
      itemBuilder: (BuildContext context) => data
          .map((element) => PopupMenuItem(
                child: Text(
                  Location.fromSnapshot(element).name,
                  style: MyTheme.dropDownMenuItemStyle(context),
                ),
                value: Location.fromSnapshot(element).name,
              ))
          .toList(),
      onSelected: (valueSelected) {
        _appBloc.setFromLocation(valueSelected);
      },
      child: Row(
        children: <Widget>[
          StreamBuilder(
            stream: _appBloc.fromLocation,
            initialData: "Seleziona",
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return Text(
                snapshot.data,
                style: MyTheme.dropDownLabelStyle(context),
              );
            },
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _createSearchField(BuildContext context) {

    final _appBloc = BlocProvider.of<AppBloc>(context);

    return TextField(
      style: MyTheme.dropDownMenuItemStyle(context),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 14.0,
        ),
        suffixIcon: Material(
          elevation: 2.0,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return FlightResults();
                }),
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
      onChanged: (value) {
        _appBloc.setToLocation(value);
      },
    );
  }
}
