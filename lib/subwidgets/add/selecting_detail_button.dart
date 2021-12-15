import 'package:caregiver_app/theme.dart';
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

  static const double _iconSize = 40.0;
  static const double _buttonSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: callback,
          child: Align(
              alignment: Alignment.center,
              child: Icon(icon, size: _iconSize, color: getItemColor(color))),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: CircleBorder(),
            padding: EdgeInsets.all(0),
            primary: getItemOpacityColor(color),
            fixedSize: Size(_buttonSize, _buttonSize), // <-- Button color
            onPrimary: Colors.white, // <-- Splash color
          )),
      SizedBox(height: 10),
      Text(name, style: TextStyle(fontWeight: FontWeight.w400))
    ], mainAxisAlignment: MainAxisAlignment.center);
  }
}
