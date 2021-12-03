import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/subwidgets/event_timestamp_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

import 'event_list_widget.dart';

class EventListItemWidget extends StatefulWidget {
  const EventListItemWidget({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  State<StatefulWidget> createState() => _EventListItemWidgetState();
}

class _EventListItemWidgetState extends State<EventListItemWidget> {
  final double _eventListItemHeight = 70;
  static const double _marginBetweenListItems = 10;
  static const double _taskBoxPadding = 14;
  static const double _checkBoxSize = 28;

  Color getEventBackgroundColor() {
    if (widget.event.isComplete()) {
      return onSecondaryColorMaterial.shade200;
    } else {
      return onSecondaryColorMaterial.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: _marginBetweenListItems),
        padding: const EdgeInsets.all(10.0),
        color: getEventBackgroundColor(),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Button to mark complete/incomplete
              Container(
                  //color: Colors.pink,
                  height: _checkBoxSize,
                  width: _checkBoxSize + _taskBoxPadding + taskListPaddingLeft,
                  padding: const EdgeInsets.only(right: _taskBoxPadding),
                  child: Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: onSecondaryColorMaterial.shade300,
                          checkColor: Colors.black,
                          value: widget.event.isComplete(),
                          onChanged: (value) {
                            setState(() {
                              widget.event.toggleComplete();
                            });
                          }))),
              // Event Detail Indicators //TODO: Talk about how to format this, should be toggled to be either the circle one or the checkbox, not both
              /*Column(
                  children: widget.event.details.map((detail) {
                String color = DetailTypeAccessObject.getTypeColor(detail.typeId);
                return DetailDotWidget(typeColor: color);
              }).toList()),*/
              // Event Info
              Expanded(
                  child: SizedBox(
                      height: _eventListItemHeight,
                      //color: Colors.blue,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Event Name
                            Text(widget.event.name,
                                style:
                                    const TextStyle(fontSize: mediumTextSize)),
                            // Event Details
                            Row(
                                children: widget.event.details
                                    .map((eventDetail) => Text(eventDetail.name,
                                        style: const TextStyle(
                                            fontSize: mediumSmallTextSize)))
                                    .toList())
                          ]))),
              // Event Time
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  //alignment: Alignment.topRight,
                  children: [EventTimestampWidget(event: widget.event)])
            ]));
  }
}
