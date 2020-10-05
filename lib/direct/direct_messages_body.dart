import 'package:flutter/material.dart';
import 'package:wook_application/direct/direct_messages.dart';


class DirectBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Flexible(child: DirectMessages())
      ],
    );
  }
}
