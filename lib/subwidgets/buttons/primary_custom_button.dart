import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class PrimaryCustomButton extends StatelessWidget {
  const PrimaryCustomButton(
      {Key? key, required this.string, required this.onPressed})
      : super(key: key);
  final String string;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(string),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: onPrimaryColorMaterial.shade400,
            onPrimary: Colors.white,
            elevation: 0,
            fixedSize: const Size(125, 40),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: mediumSmallTextSize,
                color: Colors.white), //TODO: This isn't working
            /*padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(15.0)),*/
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )));
  }
}
