import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme.dart';

class CareTextFieldWidget extends StatefulWidget {
  var numLines = 1;
  var type = 'text';
  String text = '';
  CareTextFieldWidget(
      {Key? key, this.text = '', this.numLines = 1, this.type = 'text'})
      : super(key: key);
  bool _isEditingText = false;
  late TextEditingController _editingController;

  @override
  State<StatefulWidget> createState() => _CareTextFieldWidgetState();
}

class _CareTextFieldWidgetState extends State<CareTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget._isEditingText) {
      return _getFieldContainer(TextField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        decoration: _getFieldDecoration(),
        onSubmitted: (newValue) {
          _setStateAfterSavePressed(newValue);
        },
        autofocus: true,
        controller: widget._editingController,
        maxLines: widget.numLines, // allow user to enter 5 line in textfield
        keyboardType: _getKeyboardType(),
      ));
    }
    return _getFieldContainer(InkWell(
        onTap: () {
          _setStateAfterEditPressed();
        },
        child: TextFormField(
          decoration: _getFieldDecoration(),
          initialValue: widget.text,
          maxLines: widget
              .numLines, // allow user to enter multiple lines in textfield
          keyboardType: _getKeyboardType(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        )));
  }

  InputDecoration _getFieldDecoration() {
    return InputDecoration(
        border: InputBorder.none, //OutlineInputBorder(),
        fillColor: onSecondaryColorMaterial.shade100,
        filled: true,
        contentPadding: const EdgeInsets.only(
            left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
        suffixIcon: IconButton(
          icon: const Icon(Icons.edit, size: 20),
          onPressed: () {},
        ),
        prefixIcon: (widget.type == 'phone')
            ? IconButton(
                icon: const Icon(Icons.phone, size: 20),
                onPressed: () => _launchURL("tel://${widget.text}"))
            : null);
  }

  void _setStateAfterSavePressed(newValue) {
    setState(() {
      widget.text = newValue;
      widget._isEditingText = false;
    });
  }

  void _setStateAfterEditPressed() {
    setState(() {
      widget._isEditingText = true;
    });
  }

  void _launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  Widget _getFieldContainer(child) {
    return Container(
      width: 300,
      height: 20.0 + (30.0 * widget.numLines),
      alignment: Alignment.center,
      child: child,
    );
  }

  TextInputType _getKeyboardType() {
    if (widget.numLines > 1) {
      return TextInputType.multiline;
    }
    if (widget.type == 'phone') {
      return TextInputType.phone;
    } else {
      return TextInputType.text;
    }
  }

  @override
  void initState() {
    super.initState();
    widget._editingController = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    widget._editingController.dispose();
    super.dispose();
  }
}