import 'dart:math';

import 'package:caregiver_app/data_objects/detail.dart';

class Event {
  String? id;
  String name;
  final String carePlanId;
  List<Detail> details;
  final int createdAt;
  int? dueAt;
  int? completedAt;
  int? notifyAt;
  String? assignedUserId;

  Event(this.id, this.name, this.carePlanId, this.details, this.createdAt,
      this.dueAt, this.completedAt, this.notifyAt, this.assignedUserId);
  Event.withoutId(this.name, this.carePlanId, this.details, this.createdAt,
      this.dueAt, this.completedAt, this.notifyAt, this.assignedUserId) {
    id = generateRandomId();
  }

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
    String carePlanId, String name, List<Detail> details) {
  var random = Random();

  var id = generateRandomId();
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

  return Event(id, name, carePlanId, details, createdAt, dueAt, completedAt,
      notifyAt, assignedUserId);
}

String generateRandomId() {
  var random = Random();
  // Generates a number between 10^11 and 10^12
  return 'E_${100000000000 + ((random.nextInt(4294967296) << 32) | random.nextInt(4294967296)) % 899999999999}';
}