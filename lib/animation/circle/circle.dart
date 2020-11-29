import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circle_painter.dart';

class CircleWaveRoute extends StatefulWidget {
  @override
  _CircleWaveRouteState createState() => _CircleWaveRouteState();
}

class _CircleWaveRouteState extends State<CircleWaveRoute>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;
  double waveGap = 10.0;
  Animation<double> _animation;
  AnimationController controller;
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 25), vsync: this);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: 0.0, end: waveGap).animate(controller)
      ..addListener(() {
        setState(() {
          waveRadius = _animation.value;
        });
      });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CustomPaint(
        size: Size(300, 300),
        painter: CircleWavePainter(waveRadius),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }

  changeData() {
    setState(() {
      controller.reset();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
