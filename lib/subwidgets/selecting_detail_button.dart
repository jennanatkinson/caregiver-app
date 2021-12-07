import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectingDetailButton extends StatelessWidget {
  const SelectingDetailButton(
      {Key? key,
      required this.icon,
      required this.name,
      required this.color,
      required this.callback})
      : super(key: key);
  final IconData icon;
  final String name;
  final String color;
  final VoidCallback callback;

  static const double _iconSize = 100.0;
  static const double _buttonSize = 150.0;
  static const int _buttonColorBase = 16;
  static const int _buttonColorAlpha = 0xFF000000;
  static const double _paddingBetweenElements = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          child: Icon(icon, size: _iconSize),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  const Size(_buttonSize, _buttonSize)),
              shape: MaterialStateProperty.all(const CircleBorder()),
              backgroundColor: MaterialStateProperty.all(Color(
                  int.parse(color, radix: _buttonColorBase) +
                      _buttonColorAlpha))),
          onPressed: callback),
      const Padding(padding: EdgeInsets.all(_paddingBetweenElements)),
      Text(name)
    ], mainAxisAlignment: MainAxisAlignment.center);
  }
}