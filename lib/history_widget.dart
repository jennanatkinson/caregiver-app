import 'package:caregiver_app/data_objects/care_plan.dart';
import 'package:caregiver_app/main_app_bar.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/events/event_list_widget.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {
  HistoryWidget(
      {Key? key,
      required this.userId,
      required this.carePlan,
      required this.patientInitials})
      : super(key: key);
  final String userId;
  final CarePlan carePlan;
  final String patientInitials;
  final List<String> _tabStrings = [
    StringLibrary.getString('HISTORY', 'TIMELINE_TAB')
  ];

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Necessary for tabs to work
        body: DefaultTabController(
      // Number of tabs
      length: 1,
      // Necessary for scrolling
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
          body: TabBarView(children: [
            // First tab (History)
            EventListWidget(
                userId: widget.userId,
                carePlanId: widget.carePlan.id,
                allTasks: true,
                showHistory: true),
          ])),
    ));
  }
}