import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/select_detail_type_widget.dart';
import 'package:caregiver_app/subwidgets/select_detail_widget.dart';
import 'package:flutter/material.dart';

class AddDetailWidget extends StatefulWidget {
  const AddDetailWidget(
      {Key? key,
      required this.user,
      required this.cancelCallback,
      required this.selectDetailCallback})
      : super(key: key);

  final String user;
  final VoidCallback cancelCallback;
  final Function(String) selectDetailCallback;

  @override
  State<AddDetailWidget> createState() => _AddDetailWidgetState();
}

class _AddDetailWidgetState extends State<AddDetailWidget> {
  String? _typeId;
  String? _color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                StringLibrary.getString('NEW_EVENT', 'SELECT_DETAIL_TYPE')),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: widget.cancelCallback,
            )),
        body: (_typeId == null)
            ? SelectDetailTypeWidget(
                user: widget.user, callback: _selectDetailTypeCallback)
            : SelectDetailWidget(
                typeId: _typeId as String,
                color: _color as String,
                selectCallback: widget.selectDetailCallback));
  }

  _selectDetailTypeCallback(String typeId, String color) {
    setState(() {
      _typeId = typeId;
      _color = color;
    });
  }
}