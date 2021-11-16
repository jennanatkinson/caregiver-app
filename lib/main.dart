import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/tasks_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

import 'navbar_widget.dart';

void main() => runApp(CaregiverApp());

class CaregiverApp extends StatefulWidget {
  CaregiverApp({Key? key}) : super(key: key);
  final String _appTitle = StringLibrary.getString('MAIN', 'APP_TITLE');

  // Currently active view. Defauls to "Tasks"
  int _currentView = 0;
  // Main views in the app
  final List<Widget> _views = [
    TasksWidget(
        carePlanName: StringLibrary.getString('MAIN', 'CARE_PLAN_NAME'),
        patientInitials: 'E'),
    // Change to "Add" widget
    const Icon(Icons.add, size: 150),
    // Change to "Manage Care" widget
    const Icon(Icons.people, size: 150),
    // Change to "Settings" widget
    const Icon(Icons.settings, size: 150)
  ];

  @override
  State<StatefulWidget> createState() => _CaregiverAppState();
}

class _CaregiverAppState extends State<CaregiverApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: widget._appTitle,
        home: Scaffold(
          // Currently active view
          body: widget._views.elementAt(widget._currentView),
          // Tabs to swap between the main views
          bottomNavigationBar: NavbarWidget(
            activePosition: widget._currentView,
            swapViewCallback: swapViewCallback,
          ),
        ),
        theme: mainThemeData);
  }

  // Updates the currently active view. Called by the bottom navigation bar
  void swapViewCallback(int index) {
    setState(() {
      widget._currentView = index;
    });
  }

  // void SwapViewCallback(int index) {
  //   widget._currentView = index;
  // }
}