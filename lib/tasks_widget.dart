import 'package:flutter/material.dart';

import 'theme.dart';
import 'main_app_bar.dart';
import 'data_objects/event.dart';
import 'dao/event_access_object.dart';

double eventListItemHeight = 70.0;
double eventDetailIconDiameter = 5.0;
EventAccessObject eventAccessObject = EventAccessObject();

class TasksWidget extends StatefulWidget {
  const TasksWidget({
    Key? key,
    required this.carePlanName,
    required this.patientInitials
  }) : super(key: key);
  final String carePlanName;
  final String patientInitials;
  final String firstTab = 'My Tasks';
  final String secondTab = 'All Tasks';

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
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
                  firstTab: widget.firstTab,
                  secondTab: widget.secondTab
              )
            ];
          },
          // Lists dependent on which tab is selected
          body: TabBarView(
            children: [
              // First tab (My Tasks)
              ListView(
                children: eventAccessObject.getUncompletedEvents().map(
                  (event) => createEventListItem(event)
                ).toList()
              ),
              // Second tab (All Tasks)
              ListView(
                children: [
                  Container(
                    height: 70,
                    color: Colors.amber[600],
                    child: const Center(child: Text('2'))
                  )
                ]
              )
            ]
          )
        ),
      )
    );
  }
}

Container createEventListItem(Event event) {
  return Container(
    margin: const EdgeInsets.all(5),
    color: Colors.amber[600],
    child: Row(
      children: [
        // Event Detail Indicators
        Column(
          children: event.eventDetails.map(
            (eventDetail) => Container(
              margin: const EdgeInsets.fromLTRB(15, 5, 10, 5),
              // Sets the diameter of the circle
              width: eventDetailIconDiameter,
              height: eventDetailIconDiameter,
              // Shapes the container as a circle
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle
              )
            )
          ).toList()
        ),
        // Event Name
        Container(
          height: eventListItemHeight,
          padding: const EdgeInsets.all(10.0),
          color: Colors.amber[600],
          child: Text(event.name)
        ),
        // Event Time
        Column(
          // children: [
          //   Container: event.completedAt != null ? even
          // ]
        )
      ]
    )
  );
}

// String getEventTime(Event event) {
//   if (event.completedAt != null)
//     return DateTime.fromMillisecondsSinceEpoch(event.completedAt);
// }