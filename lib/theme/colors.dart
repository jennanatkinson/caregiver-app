import 'package:flutter/material.dart';

class CustomColors {
  static const teal = "Teal";
  static const orange = "Orange";
  static const red = "Red";
  static const grey = "Grey";

  static const Map<String, Map<int, Color>> _colors = {
    teal: {
      0: Color(0xFFF2FBFC),
      100: Color(0xFFC0EBEF),
      200: Color(0xFF81D6DF),
      300: Color(0xFF04ADC0),
      350: Color(0xFD048ABF), //30% transparent
      400: Color(0xFF048ABF),
      500: Color(0xFF02455F)
    },
    orange: {
      0: Color(0xFFFEF9F1),
      100: Color(0xFFFDECCF),
      200: Color(0xFFFBDAA0),
      300: Color(0xFFF6B541),
      400: Color(0xFFF69419),
    },
    red: {
      0: Color(0xFFFDECE9),
      100: Color(0xFFFCD9D3),
      200: Color(0xFFF9B4A6),
      300: Color(0xFFF3694D),
    },
    grey: {
      0: Color(0xFFEDEDED),
      100: Color(0xFFDBDBDB),
      200: Color(0xFFC3C3C3),
      300: Color(0xFFA09F9F),
      400: Color(0xFF888787),
      500: Color(0xFF5F5E5E)
    },
  };

  static Color getColor(String category, int value) {
    if (_colors[category] == null) {
      return Colors.black;
    }
    if ((_colors[category] as Map<int, Color>)[value] == null) {
      return Colors.black;
    }
    return (_colors[category] as Map<int, Color>)[value] as Color;
  }
}