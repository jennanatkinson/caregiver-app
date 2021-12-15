import 'package:caregiver_app/subwidgets/add/create_event_widget.dart';
import 'package:flutter/material.dart';

import 'data_objects/user.dart';

class AddWidget extends StatefulWidget {
  const AddWidget(
      {Key? key,
      required this.carePlanId,
      required this.user,
      required this.swapToEventListCallback,
      required this.swapToHistoryCallback})
      : super(key: key);
  final String carePlanId;
  final User user;
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
            carePlanId: widget.carePlanId,
            user: widget.user,
            swapToEventListCallback: widget.swapToEventListCallback,
            swapToHistoryCallback: widget.swapToHistoryCallback));
  }
}
