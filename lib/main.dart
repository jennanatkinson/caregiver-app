import 'package:flutter/material.dart';

import 'theme.dart';
import 'tasks_widget.dart';

void main() => runApp(const CaregiverApp());

class CaregiverApp extends StatelessWidget {
  const CaregiverApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Caregiver',
      home: Scaffold(
        body: TasksWidget(
          carePlanName: 'Evelyn\'s Care',
          patientInitials: 'E'
        ),
      ),
      //theme: mainThemeData,
    );
  }
}