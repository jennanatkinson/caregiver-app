import 'package:caregiver_app/dao/detail_type_access_object.dart';
import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/subwidgets/detail_dot_widget.dart';
import 'package:caregiver_app/subwidgets/event_timestamp_widget.dart';
import 'package:flutter/material.dart';

class EventListItemWidget extends StatefulWidget {
  const EventListItemWidget({Key? key, required this.event}) : super(key: key);
  final Event event;
  final double _eventListItemHeight = 70.0;

  @override
  State<StatefulWidget> createState() => _EventListItemWidgetState();
}

class _EventListItemWidgetState extends State<EventListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        // I haven't figured out how to get a shade (e.g. secondary[100] to work
        color: Theme.of(context).colorScheme.primary.withOpacity(.1),
        // color: Colors.orange[200],
        child: Row(children: [
          // Button to mark complete/incomplete
          Material(
              child: Checkbox(
                  value: widget.event.isComplete(),
                  onChanged: (value) {
                    setState(() {
                      widget.event.toggleComplete();
                    });
                  })),
          // Event Detail Indicators
          Column(
              children: widget.event.details.map((detail) {
            String color = DetailTypeAccessObject.getTypeColor(detail.typeId);
            return DetailDotWidget(typeColor: color);
          }).toList()),
          // Event Info
          Column(children: [
            // Event Name
            SizedBox(
                height: widget._eventListItemHeight,
                child: Text(widget.event.name)),
            // Event Details
            Row(
                children: widget.event.details
                    .map((eventDetail) => Text(eventDetail.name))
                    .toList())
          ]),
          // Event Time
          Expanded(
              child: Container(
                  alignment: Alignment.topRight,
                  child: EventTimestampWidget(event: widget.event)))
        ]));
  }
}