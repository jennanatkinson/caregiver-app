import 'package:caregiver_app/subwidgets/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, required this.loginCallback}) : super(key: key);
  final Function loginCallback;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Padding widget allows padding inside Scaffold
        body: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: LoginFormWidget(loginCallback: widget.loginCallback)));
  }
}