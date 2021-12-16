import 'package:caregiver_app/dao/event_access_object.dart';
import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/subwidgets/events/event_list_item_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventListWidget extends StatefulWidget {
  EventListWidget(
      {Key? key,
      required this.userId,
      required this.carePlanId,
      required this.allTasks,
      required this.showHistory})
      : super(key: key);
  final String userId;
  final String carePlanId;
  final bool allTasks;
  final bool showHistory;

  final EventAccessObject _eventAccessObject = EventAccessObject();

  @override
  State<StatefulWidget> createState() => _EventListWidgetState();
}

const double taskListPaddingLeft = 20;
const double taskListPaddingTop = 20;

class _EventListWidgetState extends State<EventListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: _createEventList());
  }

  List<Widget> _createEventList() {
    if (!widget.showHistory) {
      return _createIncompleteEventList();
    } else {
      return _createCompleteEventList();
    }
  }

  List<Widget> _createIncompleteEventList() {
    List<Widget> eventList = <Widget>[];
    List<Event> events = widget._eventAccessObject.getEvents(
        null,
        null,
        widget.carePlanId,
        null,
        false,
        null,
        widget.allTasks ? null : widget.userId);

    for (int i = 0; i < events.length; i++) {
      eventList.add(EventListItemWidget(
          event: events[i], removeEventCallback: _removeEventCallback));
    }

    return eventList;
  }

  List<Widget> _createCompleteEventList() {
    List<Widget> eventList = <Widget>[];
    List<Event> events = widget._eventAccessObject.getEvents(
        null,
        null,
        widget.carePlanId,
        null,
        true,
        null,
        widget.allTasks ? null : widget.userId);
    events.sort(_compareCompletedEvents);

    DateTime currentDate = DateTime.now();
    int dateHeaderDay = currentDate.day;
    int dateHeaderMonth = currentDate.month;
    int dateHeaderYear = currentDate.year;

    for (int i = 0; i < events.length; i++) {
      var event = events[i];
      var eventDate =
          DateTime.fromMillisecondsSinceEpoch(event.completedAt as int);
      if (i == 0 ||
          eventDate.day != dateHeaderDay ||
          eventDate.month != dateHeaderMonth ||
          eventDate.year != dateHeaderYear) {
        dateHeaderDay = eventDate.day;
        dateHeaderMonth = eventDate.month;
        dateHeaderYear = eventDate.year;
        eventList.add(_createDateHeader(DateFormat("MMMMd").format(eventDate)));
      }

      eventList.add(EventListItemWidget(
          event: event, removeEventCallback: _removeEventCallback));
    }

    return eventList;
  }

  int _compareCompletedEvents(Event b, Event a) {
    final propertyA = a.completedAt;
    final propertyB = b.completedAt;
    if (propertyA! < propertyB!) {
      return -1;
    } else if (propertyA > propertyB) {
      return 1;
    } else {
      return 0;
    }
  }

  Widget _createDateHeader(String string) {
    return Container(
        padding: const EdgeInsets.only(
            left: taskListPaddingLeft, top: taskListPaddingTop),
        child: Text(string,
            style: const TextStyle(fontSize: mediumLargeTextSize)));
  }

  void _removeEventCallback() {
    setState(() {});
  }
}