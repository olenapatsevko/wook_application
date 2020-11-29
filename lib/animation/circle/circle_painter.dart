import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:random_color/random_color.dart';

class CircleWavePainter extends CustomPainter {
  final double waveRadius;
  var wavePaint;
  static final RandomColor _randomColor = RandomColor();
  Color color = _randomColor.randomColor();

  CircleWavePainter(this.waveRadius) {
    wavePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2.0;
    double centerY = size.height / 2.0;
    double maxRadius = hypot(centerX, centerY);

    var currentRadius = waveRadius;
    while (currentRadius < maxRadius) {
      wavePaint = Paint()
        ..color = _randomColor.randomColor()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0
        ..isAntiAlias = true;
      canvas.drawCircle(Offset(centerX, centerY), currentRadius, wavePaint);

      currentRadius += 10.0;
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) {
    return oldDelegate.waveRadius != waveRadius;
  }

  double hypot(double x, double y) {
    return math.sqrt(x * x + y * y);
  }
}
