import 'package:caregiver_app/data_objects/event_detail.dart';

import '../data_objects/event.dart';
import '../data_objects/event_detail.dart';

class EventAccessObject {
  static final EventAccessObject _singleton = EventAccessObject._internal();

  factory EventAccessObject() {
    return _singleton;
  }

  EventAccessObject._internal();

  final List<Event> eventData = List.generate(
      10,
      (int i) => generateRandomEvent(
          'C_000000000000',
          'Event $i',
          List.generate(
            1,
            (int i) =>
                EventDetail('D_000000000000', 'Detail $i', 'T_000000000000'),
          )),
      growable: true);

  List<Event> getEvents(
    String? id,
    String? name,
    String? carePlanId,
    bool? isDue,
    bool? isCompleted,
    bool? willNotify,
    String? assignedUserId,
  ) {
    var events = <Event>[];
    for (var i = 0; i < eventData.length; i++) {
      if ((id == null || eventData[i].id == id) &&
          (name == null || eventData[i].name == name) &&
          (carePlanId == null || eventData[i].carePlanId == carePlanId) &&
          (isDue == null || isDue == (eventData[i].dueAt != null)) &&
          (isCompleted == null ||
              isCompleted == (eventData[i].completedAt != null)) &&
          (willNotify == null ||
              willNotify == (eventData[i].notifyAt != null)) &&
          (assignedUserId == null ||
              eventData[i].assignedUserId == assignedUserId)) {
        events.add(eventData[i]);
      }
    }
    return events;
  }
}