import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'strings.dart';

//import 'theme.dart';
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
  final String firstTab = myTasksString;
  final String secondTab = allTasksString;

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
              createEventTabListView('U_000000000000'),
              // Second tab (All Tasks)
              createEventTabListView(null)
            ]
          )
        ),
      )
    );
  }
}

ListView createEventTabListView(String? assignedUserId) {
  List<Event> incompleteEvents = eventAccessObject.getEvents(
      null, null, null, null, false, null, assignedUserId);
  List<Event> completeEvents = eventAccessObject.getEvents(
      null, null, null, null, true, null, null);

  var listItems = <Widget>[const Text(incompleteString)];
  listItems.addAll(
    incompleteEvents.map(
      (event) => createEventListItem(event)
    ).toList()
  );
  listItems.add(const Text(completeString));
  listItems.addAll(
    completeEvents.map(
        (event) => createEventListItem(event)
    ).toList()
  );

  return ListView(
    children: listItems
  );
}

Container createEventListItem(Event event) {
  var random = Random();
  bool isCompleted = (event.completedAt != null);

  return Container(
    margin: const EdgeInsets.all(5),
    color: Colors.orange[200],
    child: Row(
      children: [
        // Button to mark complete/incomplete
        Checkbox(
          value: isCompleted,
          onChanged: (bool? _) => {isCompleted = !isCompleted}
        ),
        // Event Detail Indicators
        Column(
          children: event.eventDetails.map(
            (eventDetail) => Container(
              margin: const EdgeInsets.fromLTRB(15, 5, 10, 5),
              // Sets the diameter of the circle
              width: eventDetailIconDiameter,
              height: eventDetailIconDiameter,
              // Shapes the container as a circle
              decoration: BoxDecoration(
                color: Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                shape: BoxShape.circle
              )
            )
          ).toList()
        ),
        // Event Info
        Column(
          children: [
            // Event Name
            Container(
              height: eventListItemHeight,
              child: Text(event.name)
            ),
            // Event Details
            Row(
              children: event.eventDetails.map(
                (eventDetail) => Container(
                  child: Text(eventDetail.name)
                )
              ).toList()
            )
          ]
        ),
        // Event Time
        Expanded(
          child: Container(
            alignment: Alignment.topRight,
            child: Column(
                children: [
                  Text(
                      getEventDate(event),
                      textAlign: TextAlign.right
                  ),
                  Text(
                      getEventTime(event),
                      textAlign: TextAlign.right
                  )
                ]
            )
          )
        )
      ]
    )
  );
}

String getEventDate(Event event) {
  DateTime? dateTime = getDateTime(event);
  if (dateTime == null) return '';
  return DateFormat('MMM d, y').format(dateTime);
}

String getEventTime(Event event) {
  DateTime? dateTime = getDateTime(event);
  if (dateTime == null) return '';
  return DateFormat('kk:mm').format(dateTime);
}

DateTime? getDateTime(Event event) {
  int timestamp;
  if (event.completedAt != null) {
    timestamp = event.completedAt as int;
  } else if (event.dueAt != null) {
    timestamp = event.dueAt as int;
  } else {
    return null;
  }
  return DateTime.fromMillisecondsSinceEpoch(timestamp);
}