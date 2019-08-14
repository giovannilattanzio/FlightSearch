import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {

  Stream<QuerySnapshot> fetchLocations() {
    return Firestore.instance.collection("locations").snapshots();
  }

  Stream<QuerySnapshot> fetchCities() {
    return Firestore.instance.collection("cities").snapshots();
  }

  Stream<QuerySnapshot> fetchDeals() {
    return Firestore.instance.collection("deals").snapshots();
  }
}