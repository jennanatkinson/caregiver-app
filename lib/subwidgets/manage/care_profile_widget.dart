import 'package:caregiver_app/dao/care_plan_access_object.dart';
import 'package:caregiver_app/data_objects/care_plan.dart';
import 'package:caregiver_app/string_library.dart';
import 'package:caregiver_app/theme.dart';
import 'package:flutter/material.dart';

import 'care_text_field_widget.dart';

class CareProfileWidget extends StatefulWidget {
  CareProfileWidget(
      {Key? key, required this.patientInitials, required this.carePlan})
      : super(key: key);
  final String patientInitials;
  final CarePlan carePlan;

  final CarePlanAccessObject _carePlanAccessObject = CarePlanAccessObject();

  @override
  State<StatefulWidget> createState() => _CareProfileWidgetState();
}

class _CareProfileWidgetState extends State<CareProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
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
                  onPressed: () {}, //TODO: Add Upload Pic functionality
                  child: Text(
                      StringLibrary.getString('MANAGE', 'CHANGE_PICTURE'))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getDescriptionTextElement('LEGAL_NAME'),
                  CareTextFieldWidget(
                    text: widget.carePlan.legalName,
                    saveCallback: (String legalName) {
                      widget.carePlan.legalName = legalName;
                      _updateCarePlan();
                    },
                  ),
                  _getDescriptionTextElement('PREFERRED_NAME'),
                  CareTextFieldWidget(
                    text: widget.carePlan.preferredName,
                    saveCallback: (String preferredName) {
                      widget.carePlan.preferredName = preferredName;
                      _updateCarePlan();
                    },
                  ),
                  _getDescriptionTextElement('PRONOUNS'),
                  CareTextFieldWidget(
                    text: widget.carePlan.pronouns,
                    saveCallback: (String pronouns) {
                      widget.carePlan.pronouns = pronouns;
                      _updateCarePlan();
                    },
                  ),
                  _getDescriptionTextElement('HOME_PHONE'),
                  CareTextFieldWidget(
                    text: widget.carePlan.homePhone,
                    saveCallback: (String homePhone) {
                      widget.carePlan.homePhone = homePhone;
                      _updateCarePlan();
                    },
                    type: 'phone',
                  ),
                  _getDescriptionTextElement('CELL_PHONE'),
                  CareTextFieldWidget(
                      text: widget.carePlan.cellPhone,
                      saveCallback: (String cellPhone) {
                        widget.carePlan.cellPhone = cellPhone;
                        _updateCarePlan();
                      },
                      type: 'phone'),
                  _getDescriptionTextElement('RESIDENTIAL_ADDRESS'),
                  CareTextFieldWidget(
                      text: widget.carePlan.residentialAddress,
                      saveCallback: (String residentialAddress) {
                        widget.carePlan.residentialAddress = residentialAddress;
                        _updateCarePlan();
                      },
                      maxLines: 3),
                  _getH1TextElement('MEDICAL_INFO_HEADER'),
                  _getDescriptionTextElement('ALLERGIES'),
                  CareTextFieldWidget(
                    text: widget.carePlan.allergies.join(', '),
                    saveCallback: (String allergies) {
                      widget.carePlan.allergies =
                          allergies.split(new RegExp(r', ?'));
                      _updateCarePlan();
                    },
                  ),
                  _getDescriptionTextElement('DIAGNOSES'),
                  CareTextFieldWidget(
                    text: widget.carePlan.diagnoses.join(', '),
                    saveCallback: (String diagnoses) {
                      widget.carePlan.diagnoses =
                          diagnoses.split(new RegExp(r', ?'));
                      _updateCarePlan();
                    },
                    maxLines: 3,
                  ),
                  _getDescriptionTextElement('MEDICATIONS'),
                  CareTextFieldWidget(
                    text: widget.carePlan.medications.join(', '),
                    saveCallback: (String medications) {
                      widget.carePlan.medications =
                          medications.split(new RegExp(r', ?'));
                      _updateCarePlan();
                    },
                    maxLines: 2,
                  ),
                  _getH1TextElement('EMERGENCY_INFO_HEADER'),
                  _getH2TextElement('EMERGENCY CONTACTS'),
                  Column(
                    children: List.generate(
                        widget.carePlan.emergencyContacts.length,
                        (i) => CareTextFieldWidget(
                            text: widget.carePlan.emergencyContacts[i],
                            saveCallback: (String contact) {
                              widget.carePlan.emergencyContacts[i] = contact;
                              _updateCarePlan();
                            },
                            type: 'phone')).toList(),
                  ),
                  _getH2TextElement('LOCAL_FIRST_RESPONDERS'),
                  Column(
                      children: widget.carePlan.localFirstResponders.entries
                          .map((contact) => Column(children: [
                                _getDescriptionTextElement(contact.key),
                                CareTextFieldWidget(
                                    text: contact.value,
                                    saveCallback: (String value) {
                                      widget.carePlan.localFirstResponders[
                                          contact.key] = value;
                                      _updateCarePlan();
                                    },
                                    type: 'phone')
                              ]))
                          .toList()),
                  _getH1TextElement('PRIMARY_CARE_PROVIDER_HEADER'),
                  _getDescriptionTextElement('PROVIDER_ADDRESS'),
                  CareTextFieldWidget(
                      text: widget.carePlan.primaryCareProviderAddress,
                      saveCallback: (String address) {
                        widget.carePlan.primaryCareProviderAddress = address;
                        _updateCarePlan();
                      },
                      maxLines: 3),
                  _getDescriptionTextElement('PROVIDER_PHONE'),
                  CareTextFieldWidget(
                      text: widget.carePlan.primaryCareProviderPhone,
                      saveCallback: (String phone) {
                        widget.carePlan.primaryCareProviderPhone = phone;
                        _updateCarePlan();
                      },
                      type: 'phone'),
                  //_getDescriptionTextElement('INSURANCE_CARD'),
                  //TODO: Add Image
                  _getH1TextElement('NOTES'),
                  CareTextFieldWidget(
                      text: widget.carePlan.notes,
                      saveCallback: (String notes) {
                        widget.carePlan.notes = notes;
                        _updateCarePlan();
                      },
                      maxLines: 10),
                ],
              )
            ],
          )),
    );
  }

  void _updateCarePlan() {
    setState(() {
      widget._carePlanAccessObject.updateCarePlan(widget.carePlan);
    });
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