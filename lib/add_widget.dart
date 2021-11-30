import 'package:caregiver_app/subwidgets/create_event_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class AddWidget extends StatefulWidget {
  const AddWidget(
      {Key? key, required this.carePlanId, required this.currentUser})
      : super(key: key);
  final String carePlanId;
  final String currentUser;

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
                carePlanId: widget.carePlanId, currentUser: widget.currentUser),
            padding: standardPadding));
  }
}