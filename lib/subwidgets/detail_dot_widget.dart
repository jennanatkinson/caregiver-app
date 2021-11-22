import 'dart:math';

import 'package:flutter/material.dart';

class DetailDotWidget extends StatelessWidget {
  const DetailDotWidget({Key? key, required this.typeColor}) : super(key: key);
  final String typeColor;
  final double dotDiameter = 5.0;

  @override
  Widget build(BuildContext context) {
    var random = Random();

    return Container(
        margin: const EdgeInsets.fromLTRB(15, 5, 10, 5),
        // Sets the diameter of the circle
        width: dotDiameter,
        height: dotDiameter,
        // Shapes the container as a circle
        decoration: BoxDecoration(
            color: Color(int.parse(typeColor, radix: 16)).withOpacity(1.0),
            shape: BoxShape.circle));
  }
}