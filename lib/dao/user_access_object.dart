import 'package:caregiver_app/data_objects/user.dart';

class UserAccessObject {
  static final UserAccessObject _singleton = UserAccessObject._internal();

  factory UserAccessObject() {
    return _singleton;
  }

  UserAccessObject._internal();

  final List<_UserInfo> _users = [
    _UserInfo(User('Username', 'Avery', 'U_000000000000'), 'Password'),
    _UserInfo(User('jeanb', 'Jean', 'U_000000000001'), 'jb12345')
  ];

  // Returns 'null' if the username/password combo isn't valid
  User? verifyUser(String username, String password) {
    for (int i = 0; i < _users.length; i++) {
      if (_users[i].verifyUser(username, password)) {
        return _users[i].user;
      }
    }
    return null;
  }

  List<User> getUsersInCarePlan(String carePlanId) {
    return _users.map((userInfo) => userInfo.user).toList();
  }
}

class _UserInfo {
  User user;
  String password;

  _UserInfo(this.user, this.password);

  bool verifyUser(String username, String password) {
    return username == this.user.username && password == this.password;
  }
}