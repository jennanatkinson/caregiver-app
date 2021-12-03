import 'package:caregiver_app/data_objects/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:caregiver_app/theme.dart';

class EventTimestampWidget extends StatelessWidget {
  const EventTimestampWidget({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    DateTime? eventDateTime = getDateTime(event);

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
              getEventDate(eventDateTime),
              style: const TextStyle(fontSize: smallTextSize)),
          Text(
              getEventTime(eventDateTime),
              style: const TextStyle(fontSize: smallTextSize))
        ]
    );
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
  return DateFormat('h:mm a').format(dateTime);
}