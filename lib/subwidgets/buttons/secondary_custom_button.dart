import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class SecondaryCustomButton extends StatelessWidget {
  const SecondaryCustomButton(
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
            primary: onPrimaryColorMaterial.shade300, // background
            onPrimary: Colors.white,
            elevation: 0,
            fixedSize: const Size(300, 50),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: mediumSmallTextSize,
                color: Colors.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))));
  }
}
