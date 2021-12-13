import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/subwidgets/manage/care_text_field_widget.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

class ManageWidget extends StatefulWidget {
  const ManageWidget(
      {Key? key,
      required this.carePlanName,
      required this.user,
      required this.patientInitials})
      : super(key: key);
  final String carePlanName;
  final String user;
  final String patientInitials;

  @override
  State<ManageWidget> createState() => _ManageWidgetState();
}

class _ManageWidgetState extends State<ManageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    const SliverAppBar(
                      //TODO: Change Sliver Bar
                      title: Text('NestedScrollView'),
                    )
                  ];
                },
                body: SingleChildScrollView(
                    child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          _getH1TextElement('PERSONAL_INFO_HEADER'),
                          _getElementSpace(10),
                          CircleAvatar(
                            backgroundColor: onPrimaryColorMaterial.shade100,
                            radius: 90,
                            child: Text(widget.patientInitials,
                                style: const TextStyle(fontSize: 50)),
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: mediumTextSize,
                                    color: onGreyColorMaterial
                                        .shade500), //IDK why this isn't changing the color
                              ),
                              onPressed:
                                  () {}, //TODO: Add Upload Pic functionality
                              child: Text(StringLibrary.getString(
                                  'MANAGE', 'CHANGE_PICTURE'))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _getDescriptionTextElement('LEGAL_NAME'),
                              CareTextFieldWidget(text: 'Evelyn Johnson'),
                              _getDescriptionTextElement('PREFERRED_NAME'),
                              CareTextFieldWidget(text: 'Evelyn'),
                              _getDescriptionTextElement('PRONOUNS'),
                              CareTextFieldWidget(text: 'She/Her'),
                              _getDescriptionTextElement('HOME_PHONE'),
                              CareTextFieldWidget(
                                text: '(123)345-2345',
                                type: 'phone',
                              ),
                              _getDescriptionTextElement('CELL_PHONE'),
                              CareTextFieldWidget(
                                  text: '(123)345-2345', type: 'phone'),
                              _getDescriptionTextElement('RESIDENTIAL_ADDRESS'),
                              CareTextFieldWidget(
                                  text: '123 Rose St.\nProvo, UT 12345',
                                  numLines: 3),
                              _getH1TextElement('MEDICAL_INFO_HEADER'),
                              _getDescriptionTextElement('ALLERGIES'),
                              CareTextFieldWidget(text: 'Wheat'),
                              _getDescriptionTextElement('DIAGNOSES'),
                              CareTextFieldWidget(
                                text: 'Alzheimer\'s, seasonal allergies',
                                numLines: 3,
                              ),
                              _getDescriptionTextElement('MEDICATIONS'),
                              CareTextFieldWidget(
                                text: 'Ibuprofen, 400mg as needed',
                                numLines: 2,
                              ),
                              _getH1TextElement('EMERGENCY_INFO_HEADER'),
                              _getH2TextElement('EMERGENCY CONTACTS'),
                              CareTextFieldWidget(
                                  text: '(123)345-2345', type: 'phone'),
                              CareTextFieldWidget(
                                  text: '(123)345-2345', type: 'phone'),
                              _getH2TextElement('LOCAL_FIRST_RESPONDERS'),
                              _getDescriptionTextElement('LOCAL_HOSPITAL'),
                              CareTextFieldWidget(
                                  text: '(123)345-2345', type: 'phone'),
                              _getDescriptionTextElement('LOCAL_POLICE'),
                              CareTextFieldWidget(
                                  text: '(123)345-2345', type: 'phone'),
                              _getDescriptionTextElement('LOCAL_FIRE'),
                              CareTextFieldWidget(
                                  text: '(123)345-2345', type: 'phone'),
                              _getH1TextElement('PRIMARY_CARE_PROVIDER_HEADER'),
                              _getDescriptionTextElement('PROVIDER_ADDRESS'),
                              CareTextFieldWidget(
                                  text: '123 Rose St.\nProvo, UT 12345',
                                  numLines: 3),
                              _getDescriptionTextElement('PROVIDER_PHONE'),
                              CareTextFieldWidget(
                                  text: '(123)345-2345', type: 'phone'),
                              //_getDescriptionTextElement('INSURANCE_CARD'),
                              //TODO: Add Image
                              _getH1TextElement('NOTES'),
                              CareTextFieldWidget(text: 'Hello', numLines: 10),
                            ],
                          )
                        ],
                      )),
                )))));
  }

  Widget _getH1TextElement(String key) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(StringLibrary.getString('MANAGE', key),
            style: const TextStyle(fontSize: mediumLargeTextSize)));
  }

  Widget _getH2TextElement(String key) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(StringLibrary.getString('MANAGE', key),
            style: const TextStyle(fontSize: mediumSmallTextSize)));
  }

  Widget _getDescriptionTextElement(String key) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(StringLibrary.getString('MANAGE', key),
            style: const TextStyle(
                fontSize: smallTextSize, fontWeight: FontWeight.w300)));
  }

  Widget _getElementSpace(double number) {
    return SizedBox(height: number);
  }
}