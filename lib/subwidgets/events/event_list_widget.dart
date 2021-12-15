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
      required this.allTasks,
      required this.showHistory})
      : super(key: key);
  final String userId;
  final bool allTasks;
  final bool showHistory;

  final EventAccessObject _eventAccessObject = EventAccessObject();

  @override
  State<StatefulWidget> createState() => _EventListWidgetState();
}

const double taskListPaddingLeft = 20;
const double taskListPaddingTop = 20;

class _EventListWidgetState extends State<EventListWidget> {
  var _listItems = <Widget>[];

  @override
  Widget build(BuildContext context) {
    _generateListItems();
    return ListView(children: _listItems);
  }

  //TODO: figure out how to make this update
  void _generateListItems() {
    _listItems = <Widget>[];
    List<Event> incompleteEvents = widget._eventAccessObject.getEvents(null,
        null, null, null, false, null, widget.allTasks ? null : widget.userId);
    List<Event> completeEvents = widget._eventAccessObject.getEvents(null, null,
        null, null, true, null, widget.allTasks ? null : widget.userId);

    if (!widget.showHistory) {
      for (int i = 0; i < incompleteEvents.length; i++) {
        _listItems.add(EventListItemWidget(
          event: incompleteEvents[i],
          removeItemCallback: _generateListItems,
        ));
      }
    } else {
      DateTime currentDate = DateTime.now();
      completeEvents.sort(_compareCompletedEvents);
      for (int i = 0; i < completeEvents.length; i++) {
        var event = completeEvents[i];
        var eventDate =
            DateTime.fromMillisecondsSinceEpoch(event.completedAt as int);
        if (i == 0 ||
            eventDate.month != currentDate.month ||
            eventDate.day != currentDate.day) {
          currentDate = DateTime(
              currentDate.year,
              eventDate.month,
              eventDate.day,
              currentDate.hour,
              currentDate.minute,
              currentDate.second,
              currentDate.millisecond,
              currentDate.microsecond);
          _listItems
              .add(_getEventTitle(DateFormat("MMMMd").format(currentDate)));
        }

        _listItems.add(EventListItemWidget(
          event: event,
          removeItemCallback: _generateListItems,
        ));
      }
    }
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

  Widget _getEventTitle(String string) {
    return Container(
        padding: const EdgeInsets.only(
            left: taskListPaddingLeft, top: taskListPaddingTop),
        child: Text(string,
            style: const TextStyle(fontSize: mediumLargeTextSize)));
  }
}
