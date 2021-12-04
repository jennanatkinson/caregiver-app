import 'package:caregiver_app/main_app_bar.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/event_list_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {
  HistoryWidget(
      {Key? key, required this.carePlanName, required this.patientInitials})
      : super(key: key);
  final String carePlanName;
  final String patientInitials;
  String _currentUser = '';
  final String _firstTab = StringLibrary.getString('HISTORY', 'TIMELINE_TAB');
  final String _secondTab = StringLibrary.getString('HISTORY', 'CALENDAR_TAB');

  set login(String userId) {
    _currentUser = userId;
  }

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
                // First tab (Recent)
                EventListWidget(
                    currentUser: widget._currentUser,
                    allTasks: true,
                    showHistory: true),
                // Second tab (Month)
                EventListWidget(
                    currentUser: widget._currentUser,
                    allTasks: true,
                    showHistory: true),
              ]))),
    ));
  }
}
