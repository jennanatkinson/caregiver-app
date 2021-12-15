import 'package:caregiver_app/dao/detail_access_object.dart';
import 'package:caregiver_app/dao/detail_type_access_object.dart';
import 'package:caregiver_app/dao/event_access_object.dart';
import 'package:caregiver_app/data_objects/detail.dart';
import 'package:caregiver_app/data_objects/event.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/add/add_detail_widget.dart';
import 'package:caregiver_app/subwidgets/buttons/added_detail_custom_button.dart';
import 'package:caregiver_app/subwidgets/buttons/primary_custom_button.dart';
import 'package:caregiver_app/subwidgets/buttons/secondary_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme.dart';

class CreateEventWidget extends StatefulWidget {
  CreateEventWidget(
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
          cancelCallback: () {
            setState(() => {_selectingDetail = false});
          },
          selectDetailCallback: _selectDetailCallback);
    }

    var paddingBetweenItems =
        const Padding(padding: EdgeInsets.only(top: 10, bottom: 10));

    return Padding(
        padding: standardPadding,
        child: Form(
            key: _key,
            child: Column(children: [
              SizedBox(height: 200),
              // Event Name
              TextFormField(
                  controller: eventNameController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText:
                          StringLibrary.getString('NEW_EVENT', 'EVENT_NAME'))),
              paddingBetweenItems,
              Row(children: [
                SizedBox(width: 10),
                // Event Date
                Row(children: [
                  Text(StringLibrary.getString('NEW_EVENT', 'DATE')),
                  SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text(DateFormat('MMM d, y').format(_selectedDate)),
                      style: _getDateTimeButtonStyle())
                ]),
                SizedBox(width: 25),
                // Event Time
                Row(children: [
                  Text(StringLibrary.getString('NEW_EVENT', 'TIME')),
                  SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: Text(DateFormat('hh:mm').format(_selectedDate)),
                      style: _getDateTimeButtonStyle())
                ])
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
                          : Text(StringLibrary.getString(
                              'NEW_EVENT', 'UNASSIGNED')))
                ]),
              paddingBetweenItems,
              // Details list
              Column(
                  children: _details
                      .map((detail) => _getDetailButton(detail))
                      .toList()),
              paddingBetweenItems,
              SecondaryCustomButton(
                  onPressed: _beginSelectingDetail,
                  string: '+ ' +
                      StringLibrary.getString('NEW_EVENT', 'ADD_DETAIL')),
              Expanded(
                  //This makes the Submit button stay at the bottom
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: PrimaryCustomButton(
                          onPressed: () => {
                                _submitEvent(context),
                                (_isFutureEvent())
                                    ? widget.swapToEventListCallback()
                                    : widget.swapToHistoryCallback()
                              },
                          string:
                              StringLibrary.getString('NEW_EVENT', 'SUBMIT'))))
            ])));
  }

  Widget _getDetailButton(Detail detail) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: AddedDetailCustomButton(
            string: detail.name,
            colorId: DetailTypeAccessObject.getTypeColor(detail.typeId),
            onPressed: () => {
                  setState(() => {_details.remove(detail)})
                }));
  }

  ButtonStyle _getDateTimeButtonStyle() {
    return ElevatedButton.styleFrom(
        primary: onPrimaryColorMaterial.shade100,
        onPrimary: Colors.black,
        elevation: 0);
  }

  _selectDetailCallback(String detailId) {
    setState(() {
      if (!_details.contains(widget._detailAccessObject.getDetail(detailId))) {
        _details.add(widget._detailAccessObject.getDetail(detailId));
      }
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
        (_selectedUser == null) ? widget.user : _selectedUser));
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
