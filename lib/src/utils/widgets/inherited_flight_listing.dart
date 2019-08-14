import 'package:flutter/material.dart';

class InheritedFlightListing extends InheritedWidget {

  final String fromLocation;
  final String toLocation;

  InheritedFlightListing({
    Key key,
    @required Widget child,
    this.fromLocation,
    this.toLocation,
  })
      : assert(child != null),
        super(key: key, child: child);

  static InheritedFlightListing of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(
        InheritedFlightListing) as InheritedFlightListing;
  }

  @override
  bool updateShouldNotify(InheritedFlightListing old) {
    return true;
  }
}