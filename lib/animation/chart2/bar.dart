import 'dart:ui' show lerpDouble;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:wook_application/animation/bar.dart';
import '../tween.dart';



class BarChartTween2 extends BarChartTween {
  final MergeTween<Bar> _barsTween;

  BarChartTween2(BarChart begin, BarChart end)
      : _barsTween = MergeTween<Bar>(begin.bars, end.bars),
        super(begin,  end);

}

class MyBarTween extends Tween<Bar> {
  MyBarTween(Bar begin, Bar end) : super(begin: begin, end: end) {
    assert(begin.rank == end.rank);
  }

  @override
  Bar lerp(double t) => Bar.lerp(begin, end, t);
}

class BarChartPainter2 extends CustomPainter {
  BarChartPainter2(Animation<BarChart> animation)
      : animation = animation,
        super(repaint: animation);

  final Animation<BarChart> animation;
  static final RandomColor _randomColor = RandomColor();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.stroke;
    final chart = animation.value;
    for (final bar in chart.bars) {
      paint.color = _randomColor.randomColor();
      canvas.drawRect(
        Rect.fromLTWH(
          bar.x,
          size.height,
          bar.width,
          bar.height,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(BarChartPainter old) => false;
}
