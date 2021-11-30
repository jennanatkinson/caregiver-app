import 'package:caregiver_app/string_library.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class NavbarWidget extends StatefulWidget {
  NavbarWidget(
      {Key? key, required this.activePosition, required this.swapViewCallback})
      : super(key: key);
  int activePosition;
  final Function swapViewCallback;
  final String _tasksButton = StringLibrary.getString('NAVBAR', 'TASKS_BUTTON');
  final String _historyButton = StringLibrary.getString('NAVBAR', 'HISTORY_BUTTON');
  final String _addButton = StringLibrary.getString('NAVBAR', 'ADD_BUTTON');
  final String _manageCareButton =
      StringLibrary.getString('NAVBAR', 'MANAGE_CARE_BUTTON');
  final String _settingsButton =
      StringLibrary.getString('NAVBAR', 'SETTINGS_BUTTON');

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        backgroundColor: Colors.white,
        selectedItemColor: onPrimaryColorMaterial.shade400,
        unselectedItemColor: Colors.black,
        onTap: onTabTapped,
        currentIndex: widget.activePosition,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.check_box, size: 30),
              label: widget._tasksButton),
          BottomNavigationBarItem(
              icon: const Icon(Icons.history, size: 30),
              label: widget._historyButton),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add_circle, size: 40, color: onTertiaryColorMaterial),
              label: widget._addButton),
          BottomNavigationBarItem(
              icon: const Icon(Icons.people, size: 30),
              label: widget._manageCareButton),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings, size: 30),
              label: widget._settingsButton)
        ]);
  }

  void onTabTapped(int index) {
    setState(() {
      widget.activePosition = index;
      widget.swapViewCallback(index);
    });
  }
}