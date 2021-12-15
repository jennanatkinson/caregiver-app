import 'package:caregiver_app/dao/detail_type_access_object.dart';
import 'package:caregiver_app/dao/event_access_object.dart';
import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/subwidgets/events/event_list_widget.dart';
import 'package:caregiver_app/subwidgets/events/event_timestamp_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class EventListItemWidget extends StatefulWidget {
  EventListItemWidget(
      {Key? key, required this.event, required this.removeItemCallback})
      : super(key: key);
  final Event event;
  final VoidCallback removeItemCallback;
  final EventAccessObject _eventAccessObject = EventAccessObject();

  @override
  State<StatefulWidget> createState() => _EventListItemWidgetState();
}

class _EventListItemWidgetState extends State<EventListItemWidget> {
  final double _eventListItemHeight = 70;
  static const double _marginBetweenListItems = 10;
  static const double _taskBoxPadding = 14;
  static const double _leadingIconSize = 28;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: _marginBetweenListItems),
        padding: const EdgeInsets.all(10.0),
        color: _getEventBackgroundColor(),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Checkbox or Circle
              Container(
                  height: _leadingIconSize,
                  width:
                      _leadingIconSize + _taskBoxPadding + taskListPaddingLeft,
                  padding:
                      const EdgeInsets.only(right: _taskBoxPadding, top: 7),
                  child: _getEventLeadingIcon()),
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
                                style: const TextStyle(
                                    fontSize: mediumMidSmallTextSize)),
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

  Color _getEventColor() {
    if (widget.event.details.isNotEmpty) {
      return getItemColor(
          DetailTypeAccessObject.getTypeColor(widget.event.details[0].typeId));
    } else {
      return onSecondaryColorMaterial.shade300;
    }
  }

  Color _getEventBackgroundColor() {
    if (widget.event.details.isNotEmpty) {
      return getItemOpacityColor(
          DetailTypeAccessObject.getTypeColor(widget.event.details[0].typeId));
    } else {
      return onSecondaryColorMaterial.shade200;
    }
  }

  Widget _getEventLeadingIcon() {
    if (widget.event.isComplete()) {
      return Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: _getEventColor()),
      );
    } else {
      return Transform.scale(
          scale: 1.3,
          child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: onGreyColorMaterial,
              checkColor: Colors.black,
              value: widget.event.isComplete(),
              onChanged: (value) {
                setState(() {
                  widget.event.toggleComplete();
                  widget._eventAccessObject.save(widget.event);
                  widget.removeItemCallback();
                });
              }));
    }
  }
}
