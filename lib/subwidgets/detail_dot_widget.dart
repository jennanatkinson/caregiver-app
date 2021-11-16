import 'dart:math';

import 'package:flutter/material.dart';

class DetailDotWidget extends StatelessWidget {
  const DetailDotWidget({Key? key}) : super(key: key);
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
            color: Color((random.nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            shape: BoxShape.circle));
  }
}