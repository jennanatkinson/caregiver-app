import 'package:caregiver_app/data_objects/care_plan.dart';

class CarePlanAccessObject {
  static final CarePlanAccessObject _singleton =
      CarePlanAccessObject._internal();

  CarePlan _carePlan = CarePlan(
      'C_000000000000',
      'Evelyn\'s Care',
      'U_000000000000',
      'Evelyn Johnson',
      'Evelyn',
      'She/Her',
      '(123)345-2345',
      '(123)345-2345',
      '123 Rose St.\nProvo, UT 12345',
      ['Wheat'],
      ['Alzheimer\'s', 'Seasonal Allergies'],
      ['Ibuprofen, 400mg as needed'],
      ['(123)345-2345', '(123)345-2345'],
      {
        'LOCAL_HOSPITAL': '(123)345-2345',
        'LOCAL_POLICE': '(123)345-2345',
        'LOCAL_FIRE': '(123)345-2345'
      },
      '123 Rose St.\nProvo, UT 12345',
      '(123)345-2345',
      'Evelyn loves board games');

  factory CarePlanAccessObject() {
    return _singleton;
  }

  CarePlanAccessObject._internal();

  CarePlan? getCarePlan(String carePlanId) {
    if (_carePlan.id == carePlanId) {
      return _carePlan;
    }
  }

  void updateCarePlan(CarePlan carePlan) {
    if (_carePlan.id == carePlan.id) {
      _carePlan = carePlan;
    }
  }
}