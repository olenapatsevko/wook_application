import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wook_application/animation/main.dart';

class ChartView extends StatefulWidget {
  ChartState createState() => new ChartState();
}

class ChartState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: ChartPage(),
      ),
    );
  }
}
