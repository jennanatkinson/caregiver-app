import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget(
      {Key? key, required this.string, required this.onPressed})
      : super(key: key);
  final String string;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(string),
        onPressed: onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(const Size(125, 40)),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: mediumSmallTextSize,
                color: Colors.white)), //TODO: This isn't working
            /*padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(15.0)),*/
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ))));
  }
}
