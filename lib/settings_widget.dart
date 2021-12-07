import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/primary_custom_button.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget(
      {Key? key,
      required this.carePlanId,
      required this.user,
      required this.logoutCallback})
      : super(key: key);
  final String carePlanId;
  final String user;
  final VoidCallback logoutCallback;

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryCustomButton(
                    string: StringLibrary.getString('LOGIN', 'LOGOUT_BUTTON'),
                    onPressed: widget.logoutCallback,
                  )
                ])));
  }
}