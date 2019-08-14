import 'package:flight_search/src/widgets/city_card.dart';
import 'package:flutter/material.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_search/src/models/city.dart';

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
        _prepareCitiesCardList(),
      ],
    );
  }

  Widget _prepareCitiesCardList() {
    return Container(
      height: 240.0,
      child: StreamBuilder(
        stream: Firestore.instance.collection("cities").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _createCityCardList(context, snapshot.data.documents);
          }
        },
      ),
    );
  }


  Widget _createCityCardList(BuildContext context, List<DocumentSnapshot> data) {
    return ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CityCard(City.fromSnapshot(data[index]));
      },
    );
  }
}
