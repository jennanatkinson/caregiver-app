import 'package:caregiver_app/data_objects/detail_type.dart';

class DetailTypeAccessObject {
  static final DetailTypeAccessObject _singleton =
      DetailTypeAccessObject._internal();

  factory DetailTypeAccessObject() {
    return _singleton;
  }

  DetailTypeAccessObject._internal();

  static final List<DetailType> typeData = [
    DetailType('T_000000000000', 'Medication', '7B61FF')
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