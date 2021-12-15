import 'package:caregiver_app/dao/detail_access_object.dart';
import 'package:caregiver_app/dao/event_access_object.dart';
import 'package:caregiver_app/data_objects/detail.dart';
import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/data_objects/user.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/add/add_detail_widget.dart';
import 'package:caregiver_app/subwidgets/add/assignee_selector.dart';
import 'package:caregiver_app/subwidgets/primary_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventWidget extends StatefulWidget {
  CreateEventWidget(
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

  // Date range for manage

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
  User? _assignedUser;
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
          userId: widget.user.userId,
          cancelCallback: () {
            setState(() => {_selectingDetail = false});
          },
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
                  hintText: StringLibrary.getString('NEW_EVENT', 'EVENT_NAME')),
              validator: (String? value) {
                return (value == null || value.isEmpty)
                    ? 'Missing Event Name'
                    : null;
              }),
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
                child: Text(DateFormat('hh:mm').format(_selectedDate)))
          ]),
          paddingBetweenItems,
          // Select Assignee Button
          Row(children: [
            // TODO: Decide on final string for here
            const Text('Assignee'),
            ElevatedButton(
                onPressed: () => _selectAssignee(context),
                child: _assignedUser != null
                    ? Text((_assignedUser as User).username)
                    : Text(StringLibrary.getString('NEW_EVENT', 'UNASSIGNED')))
          ]),
          paddingBetweenItems,
          // Details List
          Column(
              children: _details.map((detail) => Text(detail.name)).toList()),
          paddingBetweenItems,
          // Add Detail button
          PrimaryCustomButton(
              onPressed: () {
                setState(() => {_selectingDetail = true});
              },
              string: StringLibrary.getString('NEW_EVENT', 'ADD_DETAIL')),
          paddingBetweenItems,
          // Submit Button
          PrimaryCustomButton(
              onPressed: () => {
                    _submitEvent(context),
                  },
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

  // Opens the time picker and stores the selected time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay(hour: _selectedDate.hour, minute: _selectedDate.minute));
    if (picked != null &&
        (picked.hour != _selectedDate.hour ||
            picked.minute != _selectedDate.minute)) {
      setState(() {
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month,
            _selectedDate.day, picked.hour, picked.minute);
      });
    }
  }

  // Opens a modal to select a user to assign the task to
  Future<void> _selectAssignee(BuildContext context) async {
    final User? picked = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AssigneeSelector(
              carePlanId: widget.carePlanId,
              selectAssigneeCallback: (User user) {});
        });
    if (picked != _assignedUser) {
      setState(() {
        _assignedUser = picked;
      });
    }
  }

  // Saves the event to the database and then closes the Add page
  _submitEvent(BuildContext context) {
    if (_key.currentState!.validate()) {
      widget._eventAccessObject.createEvent(Event.withoutId(
          eventNameController.text,
          widget.carePlanId,
          _details,
          DateTime.now().millisecondsSinceEpoch,
          _isFutureEvent() ? _selectedDate.millisecondsSinceEpoch : null,
          _isFutureEvent() ? null : _selectedDate.millisecondsSinceEpoch,
          null,
          (_assignedUser as User).userId));
      (_isFutureEvent())
          ? widget.swapToEventListCallback()
          : widget.swapToHistoryCallback();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Missing required fields')));
    }
  }

  // Checks if the event is in the future
  bool _isFutureEvent() {
    return _selectedDate.isAfter(DateTime.now());
  }
}