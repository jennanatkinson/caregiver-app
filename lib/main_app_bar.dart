import 'package:caregiver_app/theme.dart';
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
        //TODO: Figure out how to add margin or padding to this
        // Scaffold(
        //appBar: AppBar(
        // Scrolling Behavior
        floating: _floating,
        pinned: _pinned,
        snap: _snap,
        expandedHeight: _expandedHeight,
        backgroundColor: Colors.white,

        // Title
        title: Text(carePlanName,
            style: const TextStyle(
              fontSize: mediumLargeTextSize,
              fontWeight: FontWeight.w300,
            )),
        centerTitle: true,
        collapsedHeight: 60.0, //this makes it so it doesn't collapse

        // Patient Icon
        actions: <Widget>[
          MaterialButton(
            child: CircleAvatar(
              backgroundColor: onPrimaryColorMaterial.shade100,
              child: Text(patientInitials),
            ),
            onPressed: () {},
          )
        ],

        // Context Tabs
        bottom: TabBar(
            unselectedLabelColor: onPrimaryColorMaterial.shade400,
            //TODO: Style the unselected tab's background
            indicator: BoxDecoration(color: onPrimaryColorMaterial.shade400),
            labelColor: Colors.white,
            tabs: [Tab(text: firstTab), Tab(text: secondTab)]));
  }
}
