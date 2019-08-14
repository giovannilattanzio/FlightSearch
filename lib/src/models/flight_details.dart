import 'package:cloud_firestore/cloud_firestore.dart';

class FlightDetails {
  final String airlines;
  final String date;
  final int discount;
  final int newPrice;
  final int oldPrice;
  final double rating;

  FlightDetails.fromMap(Map<String, dynamic> map)
      : assert(map['airlines'] != null),
        assert(map['date'] != null),
        airlines = map['airlines'],
        date = map['date'],
        discount = map['discount'],
        newPrice = map['newPrice'],
        oldPrice = map['oldPrice'],
        rating = map['rating'];

  FlightDetails.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data);
}
