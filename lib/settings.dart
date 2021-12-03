import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/primary_custom_button.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget(
      {Key? key, required this.carePlanId, required this.currentUser})
      : super(key: key);
  final String carePlanId;
  final String currentUser;

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  /*void logOut() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => //LoginWidget(logoutCallback())),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryCustomButton(
                      string: StringLibrary.getString('LOGIN', 'LOGOUT_BUTTON'),
                      onPressed: () => {} //logOut(),
                      )
                ])));
  }
}
