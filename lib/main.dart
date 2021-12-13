import 'package:caregiver_app/add_widget.dart';
import 'package:caregiver_app/manage_widget.dart';
import 'package:caregiver_app/settings_widget.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/tasks_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

import 'history_widget.dart';
import 'login_widget.dart';
import 'subwidgets/navbar_widget.dart';

void main() => runApp(CaregiverApp());

class CaregiverApp extends StatefulWidget {
  CaregiverApp({Key? key}) : super(key: key);
  final String _appTitle = StringLibrary.getString('MAIN', 'APP_TITLE');

  @override
  State<StatefulWidget> createState() => _CaregiverAppState();
}

class _CaregiverAppState extends State<CaregiverApp> {
  // Currently active view. Defaults to "Tasks"
  int _activeView = 0;
  // The user currently logged in. Null if a user isn't logged in.
  // String _user = '';
  // String _carePlanId = '';
  // Replacement defaults to disable the login screen.
  String _user = 'U_000000000000';
  String _carePlanId = 'C_000000000000';
  String _carePlanName = StringLibrary.getString('MAIN', 'CARE_PLAN_NAME');
  String _patientInitials = 'E';

  @override
  Widget build(BuildContext context) {
    if (_user == '') {
      return MaterialApp(
          title: widget._appTitle,
          home: LoginWidget(loginCallback: _loginCallback));
    }
    return MaterialApp(
        title: widget._appTitle,
        home: Scaffold(
          // Currently active view
          body: [
            TasksWidget(
              carePlanName: _carePlanName,
              user: _user,
              patientInitials: _patientInitials,
            ),
            HistoryWidget(
              carePlanName: StringLibrary.getString('MAIN', 'CARE_PLAN_NAME'),
              user: _user,
              patientInitials: _patientInitials,
            ),
            AddWidget(
                carePlanId: _carePlanId,
                user: _user,
                swapToEventListCallback: _swapToEventListCallback,
                swapToHistoryCallback: _swapToHistoryCallback),
            // Change to "Manage Care" widget
            ManageWidget(
                carePlanName: _carePlanName,
                user: _user,
                patientInitials: _patientInitials),
            SettingsWidget(
                carePlanId: _carePlanId,
                user: _user,
                logoutCallback: _logoutCallback),
          ].elementAt(_activeView),
          // Tabs to swap between the main views
          bottomNavigationBar: NavbarWidget(
            activePosition: _activeView,
            swapViewCallback: _swapViewCallback,
          ),
        ),
        theme: mainThemeData);
  }

  // Updates the currently active view. Called by the bottom navigation bar
  void _swapViewCallback(int index) {
    setState(() {
      _activeView = index;
    });
  }

  void _swapToEventListCallback() {
    setState(() {
      _activeView = 0;
    });
  }

  void _swapToHistoryCallback() {
    setState(() {
      _activeView = 1;
    });
  }

  void _loginCallback(String userId) {
    setState(() {
      _activeView = 0;
      _user = userId;
      _carePlanId = 'C_000000000000';
    });
  }

  void _logoutCallback() {
    setState(() {
      _user = '';
      _carePlanId = '';
    });
  }
}