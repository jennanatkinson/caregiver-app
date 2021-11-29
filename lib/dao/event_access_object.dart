import 'package:caregiver_app/dao/detail_access_object.dart';
import 'package:caregiver_app/data_objects/event.dart';

class EventAccessObject {
  static final EventAccessObject _singleton = EventAccessObject._internal();

  factory EventAccessObject() {
    return _singleton;
  }

  EventAccessObject._internal();

  final List<Event> eventData = List.generate(
      10,
      (int i) => generateRandomEvent('C_000000000000', 'Event $i',
          [DetailAccessObject.getDetail('D_000000000000')]),
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

  void createEvent(Event event) {
    eventData.add(event);
  }
}