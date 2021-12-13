import 'package:caregiver_app/subwidgets/login/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, required this.loginCallback}) : super(key: key);
  final Function loginCallback;
  final loginPadding = const EdgeInsets.fromLTRB(60, 0, 60, 0);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Padding widget allows padding inside Scaffold
        body: Padding(
            padding: widget.loginPadding,
            child: LoginFormWidget(loginCallback: widget.loginCallback)));
  }
}