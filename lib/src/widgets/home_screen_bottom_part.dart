import 'package:flutter/material.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/utils/util.dart';

class HomeScreenBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Visualizzati al momento",
                style: MyTheme.dropDownMenuItemStyle(context),
              ),
              Spacer(),
              Text(
                "VISUALIZZA TUTTI (12)",
                style: MyTheme.viewAllStyle(context),
              ),
            ],
          ),
        ),
        createCityCardList(),
      ],
    );
  }

  Widget createCityCardList() {
    return Container(
      height: 240.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: Cities.cityCards,
      ),
    );
  }
}
