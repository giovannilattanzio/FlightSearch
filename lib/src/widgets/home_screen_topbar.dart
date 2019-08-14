import 'package:flight_search/src/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flight_search/src/screens/flight_results.dart';
import 'package:flight_search/src/widgets/custom_shape_clipper.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/widgets/choice_chip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_search/src/utils/widgets/inherited_flight_listing.dart';

class HomeScreenTopBar extends StatefulWidget {
  @override
  _HomeScreenTopBarState createState() => _HomeScreenTopBarState();
}

class _HomeScreenTopBarState extends State<HomeScreenTopBar> {
  var _selectedLocation = "Seleziona";
  var _isFlightSelected = true;

  final _textEditingController = TextEditingController();

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
                      _preparePopupMenuButton(),
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

  Widget _preparePopupMenuButton() {
    return StreamBuilder(
      stream: Firestore.instance.collection("locations").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _createPopupMenuButton(context, snapshot.data.documents);
        }
      },
    );
  }

  Widget _createPopupMenuButton(
      BuildContext context, List<DocumentSnapshot> data) {
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
        setState(() {
          _selectedLocation = valueSelected;
        });
      },
      child: Row(
        children: <Widget>[
          Text(
            _selectedLocation,
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
      controller: _textEditingController,
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
                  return InheritedFlightListing(
                    fromLocation: _selectedLocation,
                    toLocation: _textEditingController.text,
                    child: FlightResults(),
                  );
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
