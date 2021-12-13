import 'package:caregiver_app/dao/detail_access_object.dart';
import 'package:caregiver_app/subwidgets/add/selecting_detail_button.dart';
import 'package:flutter/material.dart';

class SelectDetailWidget extends StatefulWidget {
  SelectDetailWidget(
      {Key? key,
      required this.typeId,
      required this.color,
      required this.iconId,
      required this.selectCallback})
      : super(key: key);

  final String typeId;
  final String color;
  final int iconId;
  final Function(String) selectCallback;
  final String fontFamily = 'MaterialIcons';

  final DetailAccessObject _detailAccessObject = DetailAccessObject();

  @override
  State<SelectDetailWidget> createState() => _SelectDetailWidgetState();
}

class _SelectDetailWidgetState extends State<SelectDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: widget._detailAccessObject
            .getDetailsOfType(widget.typeId)
            .map((detail) {
          return Padding(
              padding: const EdgeInsets.all(50),
              child: SelectingDetailButton(
                  icon: IconData(widget.iconId, fontFamily: widget.fontFamily),
                  name: detail.name,
                  color: widget.color,
                  callback: () => {widget.selectCallback(detail.id)}));
        }).toList());
  }
}