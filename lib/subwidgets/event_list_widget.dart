import 'package:caregiver_app/dao/event_access_object.dart';
import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/event_list_item_widget.dart';
import 'package:flutter/material.dart';

import 'package:caregiver_app/theme.dart';

class EventListWidget extends StatefulWidget {
  EventListWidget({Key? key, required this.currentUser, required this.allTasks})
      : super(key: key);
  final String currentUser;
  final bool allTasks;

  final EventAccessObject _eventAccessObject = EventAccessObject();

  @override
  State<StatefulWidget> createState() => _EventListWidgetState();
}

const double taskListPaddingLeft = 20;
const double taskListPaddingTop = 8;

class _EventListWidgetState extends State<EventListWidget> {
  @override
  Widget build(BuildContext context) {
    List<Event> incompleteEvents = widget._eventAccessObject.getEvents(
        null,
        null,
        null,
        null,
        false,
        null,
        widget.allTasks ? null : widget.currentUser);
    List<Event> completeEvents = widget._eventAccessObject.getEvents(null, null,
        null, null, true, null, widget.allTasks ? null : widget.currentUser);

    var listItems = <Widget>[Container(
        padding: const EdgeInsets.only(left: taskListPaddingLeft, top: taskListPaddingTop),
        child: Text(
              StringLibrary.getString('TASKS', 'INCOMPLETE_TASKS_HEADER'),
              style: const TextStyle(fontSize: mediumLargeTextSize)
        ))
    ];
    listItems.addAll(incompleteEvents
        .map((event) => EventListItemWidget(event: event))
        .toList());
    listItems.add(Container(
        padding: const EdgeInsets.only(left: taskListPaddingLeft, top: taskListPaddingTop+10),
        child: Text(
            StringLibrary.getString('TASKS', 'COMPLETE_TASKS_HEADER'),
            style: const TextStyle(fontSize: mediumLargeTextSize)
        ))
    );
    listItems.addAll(completeEvents
        .map((event) => EventListItemWidget(event: event))
        .toList());

    return ListView(children: listItems);
  }
}