import 'package:flutter/material.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/utils/util.dart';
import 'package:flight_search/src/models/city.dart';

class CityCard extends StatelessWidget {
  final String _name;
  final String _image;
  final String _monthAndYear;
  final int _discount;
  final int _oldPrice;
  final int _newPrice;

  final double _cardWidth = 160.0;

  CityCard(City city)
      : _name = city.cityName,
        _image = city.imagePath,
        _monthAndYear = city.monthAndYear,
        _discount = city.discount,
        _oldPrice = city.oldPrice,
        _newPrice = city.newPrice;

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
            child: Image.network(
              _image,
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
          "${Format.formatCurrency.format(_newPrice)}",
          style: MyTheme.cityCardNewPriceStyle(context),
        ),
        Container(
          width: 5.0,
        ),
        Text(
          "(${Format.formatCurrency.format(_oldPrice)})",
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
                _name,
                style: MyTheme.cityCardNameStyle(context),
              ),
              Text(
                _monthAndYear,
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
              "$_discount%",
              style: MyTheme.cityCardDiscountStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
