import 'package:caregiver_app/data_objects/care_plan.dart';
import 'package:caregiver_app/subwidgets/add/create_event_widget.dart';
import 'package:flutter/material.dart';

import 'data_objects/user.dart';

class AddWidget extends StatefulWidget {
  const AddWidget(
      {Key? key,
      required this.carePlan,
      required this.user,
      required this.swapToEventListCallback,
      required this.swapToHistoryCallback})
      : super(key: key);
  final User user;
  final CarePlan carePlan;
  final VoidCallback swapToEventListCallback;
  final VoidCallback swapToHistoryCallback;

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        body: CreateEventWidget(
            carePlanId: widget.carePlan.id,
            user: widget.user,
            swapToEventListCallback: widget.swapToEventListCallback,
            swapToHistoryCallback: widget.swapToHistoryCallback));
  }
}