import 'package:caregiver_app/dao/user_access_object.dart';
import 'package:caregiver_app/data_objects/user.dart';
import 'package:flutter/material.dart';

class AssigneeSelector extends StatelessWidget {
  AssigneeSelector(
      {Key? key,
      required this.carePlanId,
      required this.selectAssigneeCallback})
      : super(key: key);

  final String carePlanId;
  final Function(User) selectAssigneeCallback;

  final UserAccessObject _userAccessObject = UserAccessObject();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: const Text('Select User'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        children: _getListItems(context));
  }

  List<Widget> _getListItems(BuildContext context) {
    List<User> possibleAssignees =
        _userAccessObject.getUsersInCarePlan(carePlanId);
    return possibleAssignees.map((possibleAssignee) {
      return SimpleDialogOption(
          child: Text(possibleAssignee.username),
          onPressed: () {
            Navigator.pop(context, possibleAssignee);
          });
    }).toList();
  }
}