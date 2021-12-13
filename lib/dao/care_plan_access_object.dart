class CarePlanAccessObject {
  static final CarePlanAccessObject _singleton =
      CarePlanAccessObject._internal();

  factory CarePlanAccessObject() {
    return _singleton;
  }

  CarePlanAccessObject._internal();
}