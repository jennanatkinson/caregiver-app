import 'package:caregiver_app/data_objects/detail.dart';

class DetailAccessObject {
  static final DetailAccessObject _singleton = DetailAccessObject._internal();

  factory DetailAccessObject() {
    return _singleton;
  }

  DetailAccessObject._internal();

  static final List<Detail> detailData = [
    Detail('D_000000000000', 'Ibuprofen', 'T_000000000000')
  ];

  static Detail getDetail(String id) {
    for (int i = 0; i < detailData.length; i++) {
      if (detailData.elementAt(i).id == id) {
        return detailData.elementAt(i);
      }
    }

    throw 'Detail not found';
  }

  static bool detailExists(String id) {
    for (int i = 0; i < detailData.length; i++) {
      if (detailData.elementAt(i).id == id) {
        return true;
      }
    }

    return false;
  }
}