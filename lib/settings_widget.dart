import 'package:caregiver_app/data_objects/care_plan.dart';
import 'package:caregiver_app/data_objects/user.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/buttons/primary_custom_button.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget(
      {Key? key,
      required this.carePlan,
      required this.user,
      required this.logoutCallback})
      : super(key: key);
  final CarePlan carePlan;
  final User user;
  final VoidCallback logoutCallback;

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text('Account Settings'),
                  backgroundColor: onPrimaryColorMaterial.shade400,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                      fontSize: mediumTextSize, fontWeight: FontWeight.w500),
                )
              ];
            },
            body: SizedBox(
                width: double.infinity,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryCustomButton(
                        string:
                            StringLibrary.getString('LOGIN', 'LOGOUT_BUTTON'),
                        onPressed: widget.logoutCallback,
                      )
                    ]))));
  }
}