import 'package:flutter/material.dart';
import 'package:wook_application/bottom_navigation/destination.dart';
import 'post.dart';

class InstaListView extends StatefulWidget {

  final Destination destination;


  InstaListView(this.destination);

  @override
  _InstaListViewState createState() => _InstaListViewState();


}

class _InstaListViewState extends State<InstaListView> {

@override
Widget build(BuildContext context) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Flexible(child: new Post())
    ],
  );
}
}