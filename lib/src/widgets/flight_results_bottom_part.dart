import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_search/src/models/flight_details.dart';
import 'package:flight_search/src/utils/theme.dart';
import 'package:flight_search/src/widgets/flight_card.dart';
import 'package:flight_search/src/blocs/bloc_provider.dart';
import 'package:flight_search/src/blocs/flight_results_bloc.dart';

class FlightResultsBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Migliori offerte per i prossimi 6 mesi",
                style: MyTheme.dropDownMenuItemStyle(context),
              ),
            ),
            Container(
              height: 10.0,
            ),
//            FirebaseAnimatedList(
//                padding: EdgeInsets.all(8.0),
//                reverse: false,
//                query: databaseReferenceNTD,
//                itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation, int index){
//
//                  NoToDoItem item = NoToDoItem.fromSnapshot(snapshot);
//
//                  return Card(
//                    color: Colors.white10,
//                    child: ListTile(
//                      title: item,
//                      trailing: Listener(
//                        key: Key(item.itemName),
//                        child: Icon(Icons.remove_circle,
//                          color: Colors.redAccent,
//                        ),
//                        onPointerDown: (pointerEvent) {
//                          _deleteItem(item.keyString);
//                        },
//                      ),
//                      onLongPress: () => _onLongPressListTile(item),
//                    ),
//                  );
//                }
//            )
            _prepareDealsList(context),
          ],
        ),
      ),
    );
  }

  Widget _prepareDealsList(BuildContext context) {

    final _flightResultsBloc = BlocProvider.of<FlightResultsBloc>(context);

    return Expanded(
      child: StreamBuilder(
        stream: _flightResultsBloc.deals,
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _createDealsList(context, snapshot.data);
          }
        },
      ),
    );
  }

  Widget _createDealsList(BuildContext context, List<DocumentSnapshot> data) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return FlightCard(FlightDetails.fromSnapshot(data[index]));
      },
    );
  }
}
