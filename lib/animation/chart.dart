import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wook_application/animation/chart2/chart2_view.dart';
import 'package:wook_application/animation/chart_view.dart';
import 'package:wook_application/util/hex_color.dart';

import 'circle/circle.dart';

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
        body: DefaultTabController(
          length: 3,
          child: new Scaffold(
            body: TabBarView(children: [
              new Container(
                child: ChartPage(),
                color: HexColor.fromHex("#F2EFE9"),
              ),
              new Container(
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: ChartPage2(),
                  ),
                  color: HexColor.fromHex("#F2EFE9")),
              new Container(
                child: CircleWaveRoute(),
                color: HexColor.fromHex("#F2EFE9"),
              ),
            ]),
            bottomNavigationBar: new TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.bar_chart),
                ),
                Tab(
                  icon: new Icon(Icons.stacked_bar_chart),
                ),
                Tab(
                  icon: new Icon(Icons.circle),
                ),
              ],
              labelColor: Colors.black87,
              unselectedLabelColor: HexColor.fromHex("#564E58"),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: HexColor.fromHex("#904E55"),
            ),
            backgroundColor: HexColor.fromHex("#BFB48F"),
          ),
        ));
  }
}
