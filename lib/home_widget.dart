import 'package:flutter/material.dart';
import 'strings.dart';
import 'placeholder_widget.dart';
import 'tasks_widget.dart';
//Tutorial: https://www.willowtreeapps.com/craft/how-to-use-flutter-to-build-an-app-with-bottom-navigation

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State {
  int _currentIndex = 0;
  final List _children = [
    TasksWidget(
        carePlanName: 'Evelyn\'s Care',
        patientInitials: 'E'
    ),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.black)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.orange,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: taskString,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: historyString,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: addString
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: manageCareString
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: settingsString
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}