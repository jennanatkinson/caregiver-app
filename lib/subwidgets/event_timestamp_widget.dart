import 'package:caregiver_app/data_objects/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventTimestampWidget extends StatelessWidget {
  const EventTimestampWidget({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    DateTime? eventDateTime = getDateTime(event);

    return Column(children: [
      Text(getEventDate(eventDateTime), textAlign: TextAlign.right),
      Text(getEventTime(eventDateTime), textAlign: TextAlign.right)
    ]);
  }
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

String getEventDate(DateTime? dateTime) {
  if (dateTime == null) return '';
  return DateFormat('MMM d, y').format(dateTime);
}

String getEventTime(DateTime? dateTime) {
  if (dateTime == null) return '';
  return DateFormat('kk:mm').format(dateTime);
}