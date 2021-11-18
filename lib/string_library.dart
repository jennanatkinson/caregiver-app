class StringLibrary {
  static const Map<String, Map<String, String>> _strings = {
    'LOGIN': {
      'INVALID_LOGIN': 'Invalid username or password',
      'LOGIN_BUTTON': 'Log In',
      'MISSING_PASSWORD': 'Password required',
      'MISSING_USERNAME': 'Username required',
      'PASSWORD_PROMPT': 'Password',
      'USERNAME_PROMPT': 'Username'
    },
    'MAIN': {'APP_TITLE': 'Caregiver', 'CARE_PLAN_NAME': 'Evelyn\'s Care'},
    'NAVBAR': {
      'ADD_BUTTON': 'Add',
      'HISTORY_BUTTON': 'History',
      'MANAGE_CARE_BUTTON': 'Manage Care',
      'SETTINGS_BUTTON': 'Settings',
      'TASKS_BUTTON': 'Tasks'
    },
    'TASKS': {
      'ALL_TASKS_TAB': 'All Tasks',
      'COMPLETE_TASKS_HEADER': 'Complete Tasks',
      'INCOMPLETE_TASKS_HEADER': 'Incomplete Tasks',
      'MY_TASKS_TAB': 'My Tasks'
    }
  };

  static String getString(String category, String name) {
    if (_strings[category] == null) {
      return '';
    }
    if ((_strings[category] as Map<String, String>)[name] == null) {
      return '';
    }
    return (_strings[category] as Map<String, String>)[name] as String;
  }
}