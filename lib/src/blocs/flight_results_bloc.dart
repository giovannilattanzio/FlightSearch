import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/repo/firebase_provider.dart';
import 'package:rxdart/rxdart.dart';

class FlightResultsBloc implements BlocBase {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();

  final _dealsSubject = BehaviorSubject<List<DocumentSnapshot>>();

  Observable<List<DocumentSnapshot>> get deals => _dealsSubject.stream;


  FlightResultsBloc(){
    _fetchDeals();
  }

  void _fetchDeals() {
    _firebaseProvider.fetchDeals().listen((snapshot) {
      _dealsSubject.sink.add(snapshot.documents);
    });
  }

  @override
  void dispose() {
    _dealsSubject.close();
  }
}
