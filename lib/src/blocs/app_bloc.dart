import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/repo/firebase_provider.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc implements BlocBase {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  final _locationsSubject = BehaviorSubject<List<DocumentSnapshot>>();
  final _fromLocationSelectedSubject = BehaviorSubject<String>();
  final _toLocationSelectedSubject = BehaviorSubject<String>();

  Observable<List<DocumentSnapshot>> get locations => _locationsSubject.stream;

  Observable<String> get fromLocation => _fromLocationSelectedSubject.stream;

  Observable<String> get toLocation => _toLocationSelectedSubject.stream;

  AppBloc() {
    _fetchLocations();
  }

  void _fetchLocations() {
    _firebaseProvider.fetchLocations().listen((snapshot) {
      _locationsSubject.sink.add(snapshot.documents);
    });
  }

  void setFromLocation(String fromLocation) {
    _fromLocationSelectedSubject.sink.add(fromLocation);
  }

  void setToLocation(String fromLocation) {
    _toLocationSelectedSubject.sink.add(fromLocation);
  }

  @override
  void dispose() {
    _locationsSubject.close();
    _fromLocationSelectedSubject.close();
  }
}
