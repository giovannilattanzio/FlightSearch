import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/repo/firebase_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeBloc implements BlocBase {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();

  final _flightListSelectedSubject = PublishSubject<bool>();
  final _citiesSubject = BehaviorSubject<List<DocumentSnapshot>>();
  final _citiesListLenghtSubject = BehaviorSubject<int>();

  Observable<bool> get isFlightListSelected =>
      _flightListSelectedSubject.stream;

  Observable<List<DocumentSnapshot>> get cities => _citiesSubject.stream;

  Observable<int> get citiesListLenght => _citiesListLenghtSubject.stream;

  HomeBloc() {
    _fetchCities();
  }

  void setFlightListSelected(bool isFlightListSelected) {
    _flightListSelectedSubject.sink.add(isFlightListSelected);
  }

  void _fetchCities() {
    _firebaseProvider.fetchCities().listen((snapshot) {
      _citiesSubject.sink.add(snapshot.documents);
      _citiesListLenghtSubject.sink.add(snapshot.documents.length);
    });
  }

  @override
  void dispose() {
    _flightListSelectedSubject.close();
    _citiesSubject.close();
    _citiesListLenghtSubject.close();
  }
}
