import 'package:caregiver_app/dao/user_access_object.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/buttons/primary_custom_button.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  LoginFormWidget({Key? key, required this.loginCallback}) : super(key: key);
  final Function loginCallback;
  final UserAccessObject _userAccessObject = UserAccessObject();

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  // For getting values out of text fields
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Allows for form validation
    final _key = GlobalKey<FormState>();

    return Form(
      key: _key,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Username text box
        TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: StringLibrary.getString('LOGIN', 'USERNAME_PROMPT')),
            validator: (String? value) {
              return (value == null || value.isEmpty)
                  ? StringLibrary.getString('LOGIN', 'MISSING_USERNAME')
                  : null;
            }),
        // Padding between username and password text boxes
        const SizedBox(height: 10),
        // Password text box
        TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: StringLibrary.getString('LOGIN', 'PASSWORD_PROMPT')),
            obscureText: true,
            validator: (String? value) {
              return (value == null || value.isEmpty)
                  ? StringLibrary.getString('LOGIN', 'MISSING_PASSWORD')
                  : null;
            }),
        // Padding between password text box and login button
        const SizedBox(height: 10),
        // Login button
        PrimaryCustomButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                String? userId = widget._userAccessObject.verifyUser(
                    usernameController.text, passwordController.text);
                if (userId != null) {
                  widget.loginCallback(userId);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          StringLibrary.getString('LOGIN', 'INVALID_LOGIN'))));
                }
              }
            },
            string: StringLibrary.getString('LOGIN', 'LOGIN_BUTTON'))
      ]),
    );
  }
}
