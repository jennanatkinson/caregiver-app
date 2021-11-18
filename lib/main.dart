import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/tasks_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

import 'login_widget.dart';
import 'navbar_widget.dart';

void main() => runApp(CaregiverApp());

class CaregiverApp extends StatefulWidget {
  String? _currentUser;

  CaregiverApp({Key? key}) : super(key: key);
  final String _appTitle = StringLibrary.getString('MAIN', 'APP_TITLE');

  // Currently active view. Defaults to "Tasks"
  int _currentView = 0;
  // Whether a user has been authorized
  bool _loggedIn = false;
  // Main views in the app
  // final List<Widget> _views = [
  //   TasksWidget(
  //     carePlanName: StringLibrary.getString('MAIN', 'CARE_PLAN_NAME'),
  //     patientInitials: 'E',
  //     currentUser: '',
  //   ),
  //   // Change to "Add" widget
  //   const Icon(Icons.add, size: 150),
  //   // Change to "Manage Care" widget
  //   const Icon(Icons.people, size: 150),
  //   // Change to "Settings" widget
  //   const Icon(Icons.settings, size: 150)
  // ];
  final TasksWidget _tasks = TasksWidget(
    carePlanName: StringLibrary.getString('MAIN', 'CARE_PLAN_NAME'),
    patientInitials: 'E',
    currentUser: '',
  );

  @override
  State<StatefulWidget> createState() => _CaregiverAppState();
}

class _CaregiverAppState extends State<CaregiverApp> {
  @override
  Widget build(BuildContext context) {
    if (!widget._loggedIn) {
      return MaterialApp(
          title: widget._appTitle,
          home: LoginWidget(loginCallback: loginCallback));
    }
    return MaterialApp(
        title: widget._appTitle,
        home: Scaffold(
          // Currently active view
          // body: widget._views.elementAt(widget._currentView),
          body: [
            widget._tasks,
            // Change to "Add" widget
            const Icon(Icons.add, size: 150),
            // Change to "Manage Care" widget
            const Icon(Icons.people, size: 150),
            // Change to "Settings" widget
            const Icon(Icons.settings, size: 150)
          ].elementAt(widget._currentView),
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

  void loginCallback(String userId) {
    setState(() {
      widget._loggedIn = true;
      widget._tasks.currentUser = userId;
    });
  }

  void logoutCallback() {
    setState(() {
      widget._loggedIn = false;
    });
  }
}