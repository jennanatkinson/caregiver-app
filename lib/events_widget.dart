import 'package:caregiver_app/main_app_bar.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/event_list_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class EventsWidget extends StatefulWidget {
  EventsWidget(
      {Key? key,
      required this.carePlanName,
      required this.user,
      required this.patientInitials})
      : super(key: key);
  final String carePlanName;
  final String user;
  final String patientInitials;
  final String _firstTab = StringLibrary.getString('TASKS', 'MY_TASKS_TAB');
  final String _secondTab = StringLibrary.getString('TASKS', 'ALL_TASKS_TAB');

  @override
  State<EventsWidget> createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
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
          body: Padding(
              padding: noPadding,
              child: TabBarView(children: [
                // First tab (My Tasks)
                EventListWidget(
                  user: widget.user,
                  allTasks: false,
                  showHistory: false,
                ),
                // Second tab (All Tasks)
                EventListWidget(
                    user: widget.user, allTasks: true, showHistory: false)
              ]))),
    ));
  }
}