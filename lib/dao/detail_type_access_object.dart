import 'package:caregiver_app/data_objects/detail_type.dart';

class DetailTypeAccessObject {
  static final DetailTypeAccessObject _singleton =
      DetailTypeAccessObject._internal();

  factory DetailTypeAccessObject() {
    return _singleton;
  }

  DetailTypeAccessObject._internal();

  static final List<DetailType> typeData = [
    DetailType(
        'T_000000000000', 'Medication', '7B61FF', 0xE3D9, 'C_000000000000'),
    DetailType('T_000000000001', 'Social', 'FFFF00', 0xE155, 'C_000000000000'),
    DetailType('T_000000000002', 'Sleep', '3258A8', 0xE0D7, 'C_000000000000'),
    DetailType('T_000000000003', 'Food', '548A1E', 0xE25A, 'C_000000000000'),
    DetailType('T_000000000004', 'Diaper', '70411B', 0xE0C3, 'C_000000000000')
  ];

  static DetailType getDetailType(String id) {
    for (int i = 0; i < typeData.length; i++) {
      if (typeData.elementAt(i).id == id) {
        return typeData.elementAt(i);
      }
    }

    throw 'Type not found';
  }

  static bool typeExists(String id) {
    for (int i = 0; i < typeData.length; i++) {
      if (typeData.elementAt(i).id == id) {
        return true;
      }
    }

    return false;
  }

  static String getTypeColor(String id) {
    return getDetailType(id).color;
  }

  static List<DetailType> getDetailTypes(String userId) {
    return typeData;
  }
}