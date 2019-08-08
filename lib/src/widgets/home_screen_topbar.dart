import 'package:flutter/material.dart';
import 'package:flight_search/src/screens/flight_results.dart';
import 'package:flight_search/src/widgets/custom_shape_clipper.dart';
import 'package:flight_search/src/utils/util.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/widgets/choice_chip.dart';

class HomeScreenTopBar extends StatefulWidget {
  @override
  _HomeScreenTopBarState createState() => _HomeScreenTopBarState();
}

class _HomeScreenTopBarState extends State<HomeScreenTopBar> {
  var _selectedLocation = 0;
  var _isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
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
                      _createPopupMenuButton(),
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
                    child: _createSearchField(),
                  ),
                ),
                Container(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
//                    ChoiceChip(
//                      avatar: Icon(Icons.flight),
//                      selected: true,
//                      label: Text(
//                        "Voli",
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 16.0,
//                        ),
//                      ),
//                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isFlightSelected = true;
                        });
                      },
                      child: CustomChoiceChip(
                        icon: Icons.flight,
                        text: "Voli",
                        isSelected: _isFlightSelected,
                      ),
                    ),
                    Container(
                      width: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isFlightSelected = false;
                        });
                      },
                      child: CustomChoiceChip(
                        icon: Icons.hotel,
                        text: "Hotel",
                        isSelected: !_isFlightSelected,
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

  Widget _createPopupMenuButton() {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem(
          child: Text(
            Cities.locations[0],
            style: MyTheme.dropDownMenuItemStyle(context),
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: Text(
            Cities.locations[1],
            style: MyTheme.dropDownMenuItemStyle(context),
          ),
          value: 1,
        ),
      ],
      onSelected: (index) {
        setState(() {
          _selectedLocation = index;
        });
      },
      child: Row(
        children: <Widget>[
          Text(
            Cities.locations[_selectedLocation],
            style: MyTheme.dropDownLabelStyle(context),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _createSearchField() {
    return TextField(
      controller: TextEditingController(
        text: Cities.locations[1],
      ),
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
    );
  }
}
