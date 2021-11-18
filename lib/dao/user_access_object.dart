class UserAccessObject {
  static final UserAccessObject _singleton = UserAccessObject._internal();

  factory UserAccessObject() {
    return _singleton;
  }

  UserAccessObject._internal();

  // Returns 'null' if the username/password combo isn't valid
  String? verifyUser(String username, String password) {
    if (username == 'Username' && password == 'Password') {
      return 'U_000000000000';
    }
    return null;
  }
}