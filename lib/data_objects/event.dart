import 'dart:math';

import 'event_detail.dart';

class Event {
  final String id;
  String name;
  final String carePlanId;
  List<EventDetail> eventDetails;
  final int createdAt;
  int? dueAt;
  int? completedAt;
  int? notifyAt;
  String? assignedUserId;

  Event(this.id, this.name, this.carePlanId, this.eventDetails, this.createdAt,
      this.dueAt, this.completedAt, this.notifyAt, this.assignedUserId);

  toggleComplete() {
    if (completedAt == null) {
      completedAt = DateTime.now().millisecondsSinceEpoch;
    } else {
      completedAt = null;
    }
  }

  bool isComplete() {
    return completedAt != null;
  }
}

Event generateRandomEvent(
    String carePlanId, String name, List<EventDetail> eventDetails) {
  var random = Random();

  // Generates a number between 10^11 and 10^12
  var id = 100000000000 +
      ((random.nextInt(4294967296) << 32) | random.nextInt(4294967296)) %
          899999999999;

  int now = DateTime.now().millisecondsSinceEpoch;
  const int weekInMilliseconds = 604800000;
  // Generates a date between a week ago and now
  var createdAt = now - random.nextInt(weekInMilliseconds);
  // Generates null or dates between the created date and a week later
  var dueAt =
      random.nextBool() ? createdAt + random.nextInt(weekInMilliseconds) : null;
  var notifyAt =
      random.nextBool() ? createdAt + random.nextInt(weekInMilliseconds) : null;
  // Generates null or a date between the created date and now
  var completedAt = random.nextBool()
      ? (createdAt - random.nextInt(weekInMilliseconds))
      : null;

  var assignedUserId = random.nextBool() ? 'U_000000000000' : null;

  return Event('E_$id', name, carePlanId, eventDetails, createdAt, dueAt,
      completedAt, notifyAt, assignedUserId);
}