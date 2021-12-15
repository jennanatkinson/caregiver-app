import 'package:caregiver_app/subwidgets/manage/care_profile_widget.dart';
import 'package:flutter/material.dart';

import 'main_app_bar.dart';

class ManageWidget extends StatefulWidget {
  const ManageWidget(
      {Key? key,
      required this.carePlanName,
      required this.userId,
      required this.patientInitials})
      : super(key: key);
  final String carePlanName;
  final String userId;
  final String patientInitials;

  @override
  State<ManageWidget> createState() => _ManageWidgetState();
}

class _ManageWidgetState extends State<ManageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            body: DefaultTabController(
                // Number of tabs
                length: 1,
                child: NestedScrollView(
                    // Header pulled from main_app_bar.dart
                    headerSliverBuilder: (context, value) {
                      return <Widget>[
                        MainAppBar(
                            carePlanName: widget.carePlanName,
                            patientInitials: widget.patientInitials,
                            firstTab: 'Manage Care')
                      ];
                    },
                    // Lists dependent on which tab is selected
                    body: SingleChildScrollView(
                        child: CareProfileWidget(
                            patientInitials: widget.patientInitials))))));
  }
}
