import 'package:caregiver_app/dao/detail_type_access_object.dart';
import 'package:caregiver_app/subwidgets/add/selecting_detail_button.dart';
import 'package:flutter/material.dart';

class SelectDetailTypeWidget extends StatefulWidget {
  const SelectDetailTypeWidget(
      {Key? key, required this.userId, required this.callback})
      : super(key: key);
  final String userId;
  final Function(String, String, int) callback;
  final String fontFamily = 'MaterialIcons';

  @override
  State<SelectDetailTypeWidget> createState() => _SelectDetailTypeWidgetState();
}

class _SelectDetailTypeWidgetState extends State<SelectDetailTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: GridView.count(
                crossAxisCount: 2,
                children: DetailTypeAccessObject.getDetailTypes(widget.userId)
                    .map((detailType) {
                  return SelectingDetailButton(
                      icon: IconData(detailType.iconId,
                          fontFamily: widget.fontFamily),
                      name: detailType.name,
                      color: detailType.color,
                      callback: () => {
                            widget.callback(detailType.id, detailType.color,
                                detailType.iconId)
                          });
                }).toList())));
  }
}
