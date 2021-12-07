import 'package:caregiver_app/dao/detail_access_object.dart';
import 'package:caregiver_app/dao/event_access_object.dart';
import 'package:caregiver_app/data_objects/detail.dart';
import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/add_detail_widget.dart';
import 'package:caregiver_app/subwidgets/primary_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventWidget extends StatefulWidget {
  CreateEventWidget({Key? key, required this.carePlanId, required this.user})
      : super(key: key);
  final String carePlanId;
  final String user;

  // Date range for events

  final int _dateRange = 100;
  final DetailAccessObject _detailAccessObject = DetailAccessObject();
  final EventAccessObject _eventAccessObject = EventAccessObject();

  @override
  State<CreateEventWidget> createState() => _CreateEventWidgetState();
}

class _CreateEventWidgetState extends State<CreateEventWidget> {
  final _key = GlobalKey<FormState>();

  final eventNameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String? _selectedUser;
  final List<Detail> _details = List.empty(growable: true);

  bool _selectingDetail = false;

  @override
  void dispose() {
    eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectingDetail) {
      return AddDetailWidget(
          user: widget.user,
          cancelCallback: () => {_selectingDetail = false},
          selectDetailCallback: _selectDetailCallback);
    }

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
                child: Text(DateFormat('MMM d, y').format(_selectedDate)))
          ]),
          paddingBetweenItems,
          // Event Time
          Row(children: [
            const Text('Time'),
            ElevatedButton(
                onPressed: () => _selectTime(context),
                // TODO: This seems bugged. The time doesn't appear to change, but the event shows changed time
                child: Text(DateFormat('hh:mm').format(_selectedDate)))
          ]),
          if (_isFutureEvent()) paddingBetweenItems,
          if (_isFutureEvent())
            Row(children: [
              // TODO: Decide on final string for here
              const Text('Assignee'),
              ElevatedButton(
                  onPressed: () => _selectAssignee(context),
                  child: _selectedUser != null
                      ? Text(_selectedUser as String)
                      : Text(
                          StringLibrary.getString('NEW_EVENT', 'UNASSIGNED')))
            ]),
          paddingBetweenItems,
          // Details list
          Column(
              children: _details.map((detail) => Text(detail.name)).toList()),
          paddingBetweenItems,
          PrimaryCustomButton(
              onPressed: _beginSelectingDetail,
              string: StringLibrary.getString('NEW_EVENT', 'ADD_DETAIL')),
          paddingBetweenItems,
          PrimaryCustomButton(
              onPressed: () =>
                  _submitEvent(context), //TODO: Navigate back to tasks
              string: StringLibrary.getString('NEW_EVENT', 'SUBMIT'))
        ]));
  }

  _selectDetailCallback(String detailId) {
    setState(() {
      _details.add(widget._detailAccessObject.getDetail(detailId));
      _selectingDetail = false;
    });
  }

  // Opens the date picker and stores the selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(DateTime.now().year - widget._dateRange, 1, 1),
        lastDate: DateTime(DateTime.now().year + widget._dateRange, 12, 31));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = DateTime(picked.year, picked.month, picked.day,
            _selectedDate.hour, _selectedDate.minute, 0, 0);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay(hour: _selectedDate.hour, minute: _selectedDate.minute));
    if (picked != null &&
        (picked.hour != _selectedDate.hour ||
            picked.minute != _selectedDate.minute)) {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month,
          _selectedDate.day, picked.hour, picked.minute);
    }
  }

  Future<void> _selectAssignee(BuildContext context) async {}

  _submitEvent(BuildContext context) {
    widget._eventAccessObject.createEvent(Event.withoutId(
        eventNameController.text,
        widget.carePlanId,
        List.empty(),
        DateTime.now().millisecondsSinceEpoch,
        _isFutureEvent() ? _selectedDate.millisecondsSinceEpoch : null,
        _isFutureEvent() ? null : _selectedDate.millisecondsSinceEpoch,
        null,
        _selectedUser));
  }

  bool _isFutureEvent() {
    return _selectedDate.isAfter(DateTime.now());
  }

  _beginSelectingDetail() {
    setState(() {
      _selectingDetail = true;
    });
  }
}