import 'package:flutter/material.dart';

import 'login/LoginPage.dart';


void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SharedPreferences',
      home: new LoginPage(),
    );
  }
}
