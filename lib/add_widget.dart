import 'package:caregiver_app/subwidgets/add/create_event_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class AddWidget extends StatefulWidget {
  const AddWidget(
      {Key? key,
      required this.carePlanId,
      required this.user,
      required this.swapToEventListCallback,
      required this.swapToHistoryCallback})
      : super(key: key);
  final String carePlanId;
  final String user;
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
        body: Padding(
            child: CreateEventWidget(
                carePlanId: widget.carePlanId,
                user: widget.user,
                swapToEventListCallback: widget.swapToEventListCallback,
                swapToHistoryCallback: widget.swapToHistoryCallback),
            padding: standardPadding));
  }
}