import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CareTextFieldWidget extends StatefulWidget {
  CareTextFieldWidget(
      {Key? key,
      required this.text,
      required this.saveCallback,
      this.maxLines = 1,
      this.type = 'text'})
      : super(key: key);
  final String text;
  final Function(String) saveCallback;
  final maxLines;
  final type;

  @override
  State<StatefulWidget> createState() => _CareTextFieldWidgetState();
}

class _CareTextFieldWidgetState extends State<CareTextFieldWidget> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _textController.text = widget.text;

    return Container(
        width: 300,
        height: 20.0 + (30.0 * widget.maxLines),
        alignment: Alignment.center,
        child: TextFormField(
          controller: _textController,
          focusNode: _focusNode,
          decoration: _getFieldDecoration(),
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
          maxLines: widget.maxLines,
          keyboardType: _getKeyboardType(),
        ));
  }

  InputDecoration _getFieldDecoration() {
    return InputDecoration(
        border: InputBorder.none,
        fillColor: onSecondaryColorMaterial.shade100,
        filled: true,
        contentPadding: const EdgeInsets.only(
            left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
        suffixIcon: IconButton(
          icon: const Icon(Icons.edit, size: 20),
          onPressed: () {
            _focusNode.requestFocus();
          },
        ),
        prefixIcon: (widget.type == 'phone')
            ? IconButton(
                icon: const Icon(Icons.phone, size: 20),
                onPressed: () => _launchURL("tel://${widget.text}"))
            : null);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      widget.saveCallback(_textController.text);
    }
  }

  void _launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  TextInputType _getKeyboardType() {
    if (widget.maxLines > 1) {
      return TextInputType.multiline;
    }
    if (widget.type == 'phone') {
      return TextInputType.phone;
    } else {
      return TextInputType.text;
    }
  }
}