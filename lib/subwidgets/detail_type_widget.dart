import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailTypeWidget extends StatelessWidget {
  const DetailTypeWidget(
      {Key? key,
      required this.icon,
      required this.name,
      required this.color,
      required this.callback})
      : super(key: key);
  final Icon icon;
  final String name;
  final String color;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      label: Text(name),
      onPressed: () {
        callback();
      },
    );
  }
}