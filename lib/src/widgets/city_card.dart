import 'package:flutter/material.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/utils/util.dart';

class CityCard extends StatelessWidget {
  final String name;
  final String image;
  final String monthAndYear;
  final String discount;
  final double oldPrice;
  final double newPrice;

  final double _cardWidth = 160.0;

  CityCard({
    this.name,
    this.image,
    this.monthAndYear,
    this.discount,
    this.oldPrice,
    this.newPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _createCard(context),
          _createPriceInformation(context),
        ],
      ),
    );
  }

  Widget _createCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Stack(
        children: <Widget>[
          Container(
            height: 210.0,
            width: _cardWidth,
            child: Image.asset(
              this.image,
              fit: BoxFit.cover,
            ),
          ),
          _createShadow(),
          _createCityInformation(context),
        ],
      ),
    );
  }

  Widget _createPriceInformation(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 5.0,
        ),
        Text(
          "${Format.formatCurrency.format(newPrice)}",
          style: MyTheme.cityCardNewPriceStyle(context),
        ),
        Container(
          width: 5.0,
        ),
        Text(
          "${Format.formatCurrency.format(oldPrice)}",
          style: MyTheme.cityCardOldPriceStyle(context),
        ),
      ],
    );
  }

  Widget _createShadow() {
    return Positioned(
      left: 0.0,
      bottom: 0.0,
      width: _cardWidth,
      height: 60.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Colors.black,
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCityInformation(BuildContext context) {
    return Positioned(
      left: 10.0,
      bottom: 10.0,
      right: 10.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                name,
                style: MyTheme.cityCardNameStyle(context),
              ),
              Text(
                monthAndYear,
                style: MyTheme.cityCardMonthYearStyle(context),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 2.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Text(
              "$discount%",
              style: MyTheme.cityCardDiscountStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
