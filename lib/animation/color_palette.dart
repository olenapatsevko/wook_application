import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class ColorPalette {
  static final RandomColor _randomColor = RandomColor();
  static final rand = Random();
  static ColorPalette primary = ColorPalette(colors());

  static List<Color> colors() {
    List<Color> list = new List<Color>();
    for (int i = 0; i < rand.nextInt(1000); i++) {
      list.add(_randomColor.randomColor());
    }
    return list;
  }

  ColorPalette(List<Color> colors) : _colors = colors {
    assert(colors.isNotEmpty);
  }

  final List<Color> _colors;

  Color operator [](int index) => _colors[index % length];

  int get length => _colors.length;

  Color random(Random random) => this[random.nextInt(length)];
}
