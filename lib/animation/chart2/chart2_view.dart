import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:wook_application/animation/bar.dart';

import 'bar.dart';


class ChartPage2 extends StatefulWidget {
  @override
  ChartPage2State createState() => ChartPage2State();
}

class ChartPage2State extends State<ChartPage2> with TickerProviderStateMixin {
  static const size = const Size(200.0,200.0);
  final random = Random();
  AnimationController animation;
  BarChartTween2 tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    tween = BarChartTween2(
      BarChart.empty(size),
      BarChart.random(size, random),
    );
    animation.addStatusListener(animationStatusListener);
    animation.forward();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
     animation.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animation.forward();
    }
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = BarChartTween2(
        tween.evaluate(animation),
        BarChart.random(size, random),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(child:
         CustomPaint(
          willChange: true,
          size: size,
          painter: BarChartPainter2(tween.animate(animation)),
    )),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
    ))
    ;
  }
}

