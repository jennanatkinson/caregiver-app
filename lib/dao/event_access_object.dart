import 'package:caregiver_app/data_objects/event_detail.dart';

import '../data_objects/event.dart';
import '../data_objects/event_detail.dart';

class EventAccessObject {
  static final EventAccessObject _singleton = EventAccessObject._internal();

  factory EventAccessObject() {
    return _singleton;
  }

  EventAccessObject._internal();

  final List<Event> events = List.generate(
      20,
      (int i) => generateRandomEvent(
        'C_000000000000',
        'Event $i',
        <EventDetail>[
          EventDetail('D_000000000000', 'Detail 1', 'T_000000000000'),
          EventDetail('D_000000000001', 'Detail 2', 'T_000000000000')
        ],
        null
      ),
      growable: true);

  List<Event> getUserTasks(String userId) {
    var userEvents = <Event>[];
    for (var i = 0; i < events.length; i++) {
      if (events[i].assignedUserId == userId) {
        userEvents.add(events[i]);
      }
    }
    return userEvents;
  }

  List<Event> getUncompletedEvents() {
    var uncompletedEvents = <Event>[];
    for (var i = 0; i < events.length; i++) {
      if (events[i].completedAt == null) {
        uncompletedEvents.add(events[i]);
      }
    }
    return uncompletedEvents;
  }
}