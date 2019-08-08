import 'package:flight_search/src/widgets/city_card.dart';
import 'package:intl/intl.dart';

class Cities {
  static const List<String> locations = [
    'Boston (BOS)',
    'New York City (JFK)',
  ];

  static final List<CityCard> cityCards = [
    CityCard(
      name: "Las Vegas",
      image: "assets/images/lasvegas.jpg",
      monthAndYear: "Feb 2020",
      discount: "45",
      oldPrice: 4299.0,
      newPrice: 2250.0,
    ),
    CityCard(
      name: "Atene",
      image: "assets/images/athens.jpg",
      monthAndYear: "Apr 2020",
      discount: "50",
      oldPrice: 9999.0,
      newPrice: 4159.0,
    ),
    CityCard(
      name: "Sydney",
      image: "assets/images/sydney.jpeg",
      monthAndYear: "Dic 2019",
      discount: "40",
      oldPrice: 5999.0,
      newPrice: 2399.0,
    ),
  ];
}

class Format {
  static final formatCurrency = NumberFormat.simpleCurrency();

}