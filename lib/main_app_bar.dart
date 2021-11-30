import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar(
      {Key? key,
      required this.carePlanName,
      required this.patientInitials,
      required this.firstTab,
      required this.secondTab})
      : super(key: key);

  final String carePlanName;
  final String patientInitials;
  final String firstTab;
  final String secondTab;

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
  final double _expandedHeight = 90;
  final bool _floating = true;
  final bool _pinned = true;
  final bool _snap = true;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        // Scrolling Behavior
        floating: _floating,
        pinned: _pinned,
        snap: _snap,
        expandedHeight: _expandedHeight,

        // Drawer Button
        /*leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),*/

        // Title
        title: Text(carePlanName),
        centerTitle: true,

        // Patient Icon
        actions: <Widget>[
          MaterialButton(
            child: CircleAvatar(
              // backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(patientInitials),
            ),
            onPressed: () {},
          )
        ],

        // Context Tabs
        bottom: TabBar(
            //IndicatorColor: Theme.of(context).secondaryHeaderColor,
            labelColor: Theme.of(context).primaryColor,
            tabs: [Tab(text: firstTab), Tab(text: secondTab)]));
  }
}