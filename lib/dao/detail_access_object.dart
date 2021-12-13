import 'package:caregiver_app/data_objects/detail.dart';

class DetailAccessObject {
  static final DetailAccessObject _singleton = DetailAccessObject._internal();

  factory DetailAccessObject() {
    return _singleton;
  }

  DetailAccessObject._internal();

  final List<Detail> detailData = [
    Detail('D_000000000000', 'Tylenol', 'T_000000000000', 'C_000000000000'),
    Detail(
        'D_000000000001', 'Antihistamine', 'T_000000000000', 'C_000000000000'),
    Detail('D_000000000002', 'Vitamins', 'T_000000000000', 'C_000000000000'),
    Detail('D_000000000006', 'Play Date', 'T_000000000001', 'C_000000000000'),
    Detail(
        'D_000000000007', 'Grandparents', 'T_000000000001', 'C_000000000000'),
    Detail('D_000000000008', 'Story Time', 'T_000000000001', 'C_000000000000'),
    Detail('D_000000000009', 'Full Night Rest', 'T_000000000002',
        'C_000000000001'),
    Detail('D_000000000010', 'Intermittent Sleep', 'T_000000000002',
        'C_000000000001'),
    Detail('D_000000000011', 'Nightmare', 'T_000000000002', 'C_000000000000'),
    Detail('D_000000000012', 'Formula', 'T_000000000003', 'C_000000000000'),
    Detail('D_000000000013', 'Nursed', 'T_000000000003', 'C_000000000000'),
    Detail('D_000000000014', 'Real food', 'T_000000000003', 'C_000000000000'),
    Detail('D_000000000015', 'Yellow', 'T_000000000004', 'C_000000000000'),
    Detail('D_000000000016', 'Green', 'T_000000000004', 'C_000000000000'),
    Detail('D_000000000017', 'Brown', 'T_000000000004', 'C_000000000000')
  ];

  Detail getDetail(String id) {
    for (int i = 0; i < detailData.length; i++) {
      if (detailData.elementAt(i).id == id) {
        return detailData.elementAt(i);
      }
    }

    throw 'Detail not found';
  }

  bool detailExists(String id) {
    for (int i = 0; i < detailData.length; i++) {
      if (detailData.elementAt(i).id == id) {
        return true;
      }
    }

    return false;
  }

  List<Detail> getDetailsOfType(String detailTypeId) {
    List<Detail> detailsOfType = List.empty(growable: true);
    for (int i = 0; i < detailData.length; i++) {
      if (detailData.elementAt(i).typeId == detailTypeId) {
        detailsOfType.add(detailData.elementAt(i));
      }
    }
    return detailsOfType;
  }
}