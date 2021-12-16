import 'package:caregiver_app/add_widget.dart';
import 'package:caregiver_app/data_objects/care_plan.dart';
import 'package:caregiver_app/manage_widget.dart';
import 'package:caregiver_app/settings_widget.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/tasks_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

import 'data_objects/user.dart';
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
  User? _user;
  CarePlan? _carePlan;
  String _patientInitials = 'E';

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
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
              carePlan: _carePlan as CarePlan,
              userId: (_user as User).userId,
              patientInitials: _patientInitials,
            ),
            HistoryWidget(
              userId: (_user as User).userId,
              carePlan: _carePlan as CarePlan,
              patientInitials: _patientInitials,
            ),
            AddWidget(
                carePlan: _carePlan as CarePlan,
                user: (_user as User),
                swapToEventListCallback: _swapToEventListCallback,
                swapToHistoryCallback: _swapToHistoryCallback),
            // Change to "Manage Care" widget
            ManageWidget(
                carePlan: _carePlan as CarePlan,
                userId: (_user as User).userId,
                patientInitials: _patientInitials),
            SettingsWidget(
                carePlan: _carePlan as CarePlan,
                user: (_user as User),
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

  void _loginCallback(User user, CarePlan? carePlan) {
    setState(() {
      _activeView = 0;
      _user = user;
      _carePlan = carePlan;
    });
  }

  void _logoutCallback() {
    setState(() {
      _user = null;
      _carePlan = null;
    });
  }
}