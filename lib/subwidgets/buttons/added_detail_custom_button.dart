import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class AddedDetailCustomButton extends StatelessWidget {
  const AddedDetailCustomButton(
      {Key? key,
      required this.string,
      required this.colorId,
      required this.onPressed})
      : super(key: key);
  final String string;
  final String colorId;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Expanded(
              child: Align(
            child: Text(string,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: mediumSmallTextSize,
                    color: Colors.black)),
            alignment: Alignment.center,
          )),
          IconButton(
            icon: Icon(Icons.cancel_outlined, size: 25, color: Colors.black),
            onPressed: onPressed,
          ),
        ]),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: getItemOpacityColor(colorId), // background
            elevation: 0,
            fixedSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))));
  }
}
