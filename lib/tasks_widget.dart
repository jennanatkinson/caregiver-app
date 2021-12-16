import 'package:caregiver_app/data_objects/care_plan.dart';
import 'package:caregiver_app/main_app_bar.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/events/event_list_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class TasksWidget extends StatefulWidget {
  TasksWidget(
      {Key? key,
      required this.carePlan,
      required this.userId,
      required this.patientInitials})
      : super(key: key);
  final String userId;
  final CarePlan carePlan;
  final String patientInitials;
  final String _firstTab = StringLibrary.getString('TASKS', 'MY_TASKS_TAB');
  final String _secondTab = StringLibrary.getString('TASKS', 'ALL_TASKS_TAB');

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Necessary for tabs to work
        body: DefaultTabController(
      // Number of tabs
      length: 2,
      // Necessary for scrolling
      child: NestedScrollView(
          // Header pulled from main_app_bar.dart
          headerSliverBuilder: (context, value) {
            return <Widget>[
              MainAppBar(
                  carePlanName: widget.carePlan.name,
                  patientInitials: widget.patientInitials,
                  firstTab: widget._firstTab,
                  secondTab: widget._secondTab)
            ];
          },
          // Lists dependent on which tab is selected
          body: Padding(
              padding: noPadding,
              child: TabBarView(children: [
                // First tab (My Tasks)
                EventListWidget(
                  userId: widget.userId,
                  carePlanId: widget.carePlan.id,
                  allTasks: false,
                  showHistory: false,
                ),
                // Second tab (All Tasks)
                EventListWidget(
                    userId: widget.userId,
                    carePlanId: widget.carePlan.id,
                    allTasks: true,
                    showHistory: false)
              ]))),
    ));
  }
}