import 'package:flutter/material.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_search/src/models/city.dart';
import 'package:flight_search/src/widgets/city_card.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/blocs/home_bloc.dart';

class HomeScreenBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _homeBloc = BlocProvider.of<HomeBloc>(context);

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
              StreamBuilder(
                stream: _homeBloc.citiesListLenght,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(
                    "VISUALIZZA TUTTI (${snapshot.data})",
                    style: MyTheme.viewAllStyle(context),
                  );
                },
              ),
            ],
          ),
        ),
        _prepareCitiesCardList(context),
      ],
    );
  }

  Widget _prepareCitiesCardList(BuildContext context) {

    final _homeBloc = BlocProvider.of<HomeBloc>(context);

    return Container(
      height: 240.0,
      child: StreamBuilder(
        stream: _homeBloc.cities,
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _createCityCardList(context, snapshot.data);
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
