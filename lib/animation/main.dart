import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'bar.dart';


class ChartPage extends StatefulWidget {
  @override
  ChartPageState createState() => ChartPageState();
}

class ChartPageState extends State<ChartPage> with TickerProviderStateMixin {
  static const size = const Size(300.0, 300.0);
  final random = Random();
  AnimationController animation;
  BarChartTween tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    tween = BarChartTween(
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
      tween = BarChartTween(
        tween.evaluate(animation),
        BarChart.random(size, random),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          foregroundPainter: MakeCircle(strokeWidth: 5,strokeCap: StrokeCap.round),
          willChange: true,
          size: size,
          painter: BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}

// main.dart

// FOR PAINTING LINES
class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MakeCircle extends CustomPainter {
  final double strokeWidth;
  final StrokeCap strokeCap;

  MakeCircle({this.strokeCap = StrokeCap.square, this.strokeWidth = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke; //important set stroke style

    final path = Path()
      ..moveTo(strokeWidth, strokeWidth)
      ..arcToPoint(Offset(size.width - strokeWidth, size.height - strokeWidth),
          radius: Radius.circular(math.max(size.width, size.height)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
