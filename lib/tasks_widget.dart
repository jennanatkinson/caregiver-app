import 'package:caregiver_app/dao/event_access_object.dart';
import 'package:caregiver_app/main_app_bar.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/event_list_widget.dart';
import 'package:flutter/material.dart';

EventAccessObject eventAccessObject = EventAccessObject();

class TasksWidget extends StatefulWidget {
  TasksWidget(
      {Key? key, required this.carePlanName, required this.patientInitials})
      : super(key: key);
  final String carePlanName;
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
                  carePlanName: widget.carePlanName,
                  patientInitials: widget.patientInitials,
                  firstTab: widget._firstTab,
                  secondTab: widget._secondTab)
            ];
          },
          // Lists dependent on which tab is selected
          body: TabBarView(children: [
            // First tab (My Tasks)
            EventListWidget(currentUser: 'U_000000000000', allTasks: false),
            // Second tab (All Tasks)
            EventListWidget(currentUser: 'U_000000000000', allTasks: true)
          ])),
    ));
  }
}