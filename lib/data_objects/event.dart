import 'dart:math';

import 'package:flutter/material.dart';

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

  Event(
    this.id,
    this.name,
    this.carePlanId,
    this.eventDetails,
    this.createdAt,
    this.dueAt,
    this.completedAt,
    this.notifyAt,
    this.assignedUserId
  );
}

Event generateRandomEvent(
    String carePlanId,
    String name,
    List<EventDetail> eventDetails,
    String? assignedUserId
  ) {
  var random = Random();

  // Generates a number between 10^11 and 10^12
  var id = 100000000000 +
      ((random.nextInt(4294967296) << 32) | random.nextInt(4294967296))
      % 899999999999;
  // Generates a date between Jan 1, 2020 and Jan 1, 2023
  var createdAt = (1577836800 + random.nextInt(94654799)) * 1000;
  // Generates dates between the created date and a week later
  var dueAt = random.nextBool()
    ? createdAt + random.nextInt(604800) * 1000 : null;
  var completedAt = random.nextBool()
    ? createdAt + random.nextInt(604800) * 1000 : null;
  var notifyAt = random.nextBool()
    ? createdAt + random.nextInt(604800) * 1000 : null;
  return Event(
    'E_$id',
    name,
    carePlanId,
    eventDetails,
    createdAt,
    dueAt,
    completedAt,
    notifyAt,
    assignedUserId
  );
}