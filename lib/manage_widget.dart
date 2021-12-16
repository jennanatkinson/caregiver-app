import 'package:caregiver_app/data_objects/care_plan.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/manage/care_profile_widget.dart';
import 'package:flutter/material.dart';

import 'main_app_bar.dart';

class ManageWidget extends StatefulWidget {
  ManageWidget(
      {Key? key,
      required this.carePlan,
      required this.userId,
      required this.patientInitials})
      : super(key: key);
  final CarePlan carePlan;
  final String userId;
  final String patientInitials;
  final List<String> _tabStrings = [
    StringLibrary.getString('MANAGE', 'MANAGE_CARE')
  ];

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
                            carePlanName: widget.carePlan.name,
                            patientInitials: widget.patientInitials,
                            tabStrings: widget._tabStrings)
                      ];
                    },
                    // Lists dependent on which tab is selected
                    body: SingleChildScrollView(
                        child: CareProfileWidget(
                            patientInitials: widget.patientInitials,
                            carePlan: widget.carePlan))))));
  }
}