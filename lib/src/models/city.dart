import 'package:cloud_firestore/cloud_firestore.dart';

class City {
  final String cityName;
  final int discount;
  final String imagePath;
  final String monthAndYear;
  final int newPrice;
  final int oldPrice;

  City.fromMap(Map<String, dynamic> map)
      : assert(map['cityName'] != null),
        assert(map['imagePath'] != null),
        assert(map['monthAndYear'] != null),
        cityName = map['cityName'],
        discount = map['discount'],
        imagePath = map['imagePath'],
        monthAndYear = map['monthAndYear'],
        newPrice = map['newPrice'],
        oldPrice = map['oldPrice'];

  City.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data);

}