import 'package:caregiver_app/dao/detail_type_access_object.dart';
import 'package:flutter/material.dart';

import 'package:caregiver_app/subwidgets/detail_type_widget.dart';

class SelectDetailTypeWidget extends StatefulWidget {
  const SelectDetailTypeWidget({Key? key, required this.currentUser})
      : super(key: key);
  final String currentUser;

  @override
  State<SelectDetailTypeWidget> createState() => _SelectDetailTypeWidgetState();
}

class _SelectDetailTypeWidgetState extends State<SelectDetailTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: DetailTypeAccessObject.getUserTypes(widget.currentUser).map((detailType) {
              return DetailTypeWidget(
                  icon: const Icon(Icons.medication),
                  name: detailType.name,
                  callback: () {},
                  color: detailType.color
              );
            }).toList()
        ));
  }
}