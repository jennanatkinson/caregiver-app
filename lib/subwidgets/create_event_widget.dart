import 'package:caregiver_app/dao/event_access_object.dart';
import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventWidget extends StatefulWidget {
  CreateEventWidget(
      {Key? key, required this.carePlanId, required this.currentUser})
      : super(key: key);
  final String carePlanId;
  final String currentUser;

  final EventAccessObject _eventAccessObject = EventAccessObject();

  DateTime _selectedDate = DateTime.now();
  String? _selectedUser;

  // Date range for events
  final int _dateRange = 100;

  final EventAccessObject eventAccessObject = EventAccessObject();

  @override
  State<CreateEventWidget> createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget> {
  final eventNameController = TextEditingController();

  @override
  void dispose() {
    eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    var paddingBetweenItems = const Padding(padding: EdgeInsets.all(10));

    return Form(
        key: _key,
        child: Column(children: [
          // Event Name
          TextFormField(
              controller: eventNameController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText:
                      StringLibrary.getString('NEW_EVENT', 'EVENT_NAME'))),
          paddingBetweenItems,
          // Event Date
          Row(children: [
            const Text('Date'),
            ElevatedButton(
                onPressed: () => _selectDate(context),
                child:
                    Text(DateFormat('MMM d, y').format(widget._selectedDate)))
          ]),
          paddingBetweenItems,
          // Event Time
          Row(children: [
            const Text('Time'),
            ElevatedButton(
                onPressed: () => _selectTime(context),
                // TODO: This seems bugged. The time doesn't appear to change, but the event shows changed time
                child: Text(DateFormat('hh:mm').format(widget._selectedDate)))
          ]),
          if (isFutureEvent()) paddingBetweenItems,
          if (isFutureEvent())
            Row(children: [
              // TODO: Decide on final string for here
              const Text('Assignee'),
              ElevatedButton(
                  onPressed: () => _selectAssignee(context),
                  child: widget._selectedUser != null
                      ? Text(widget._selectedUser as String)
                      : Text(
                          StringLibrary.getString('NEW_EVENT', 'UNASSIGNED')))
            ]),
          paddingBetweenItems,
          ElevatedButton(
              onPressed: () =>
                  _submitEvent(context), //TODO: Navigate back to tasks
              child: Text(StringLibrary.getString('NEW_EVENT', 'SUBMIT')))
        ]));
  }

  // Opens the date picker and stores the selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget._selectedDate,
        firstDate: DateTime(DateTime.now().year - widget._dateRange, 1, 1),
        lastDate: DateTime(DateTime.now().year + widget._dateRange, 12, 31));
    if (picked != null && picked != widget._selectedDate) {
      setState(() {
        widget._selectedDate = DateTime(picked.year, picked.month, picked.day,
            widget._selectedDate.hour, widget._selectedDate.minute, 0, 0);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: widget._selectedDate.hour,
            minute: widget._selectedDate.minute));
    if (picked != null &&
        (picked.hour != widget._selectedDate.hour ||
            picked.minute != widget._selectedDate.minute)) {
      widget._selectedDate = DateTime(
          widget._selectedDate.year,
          widget._selectedDate.month,
          widget._selectedDate.day,
          picked.hour,
          picked.minute);
    }
  }

  Future<void> _selectAssignee(BuildContext context) async {}

  _submitEvent(BuildContext context) {
    widget._eventAccessObject.createEvent(Event.withoutId(
        eventNameController.text,
        widget.carePlanId,
        List.empty(),
        DateTime.now().millisecondsSinceEpoch,
        isFutureEvent() ? widget._selectedDate.millisecondsSinceEpoch : null,
        isFutureEvent() ? null : widget._selectedDate.millisecondsSinceEpoch,
        null,
        widget._selectedUser));
  }

  bool isFutureEvent() {
    return widget._selectedDate.isAfter(DateTime.now());
  }
}
