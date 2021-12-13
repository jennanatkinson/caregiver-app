class StringLibrary {
  static const Map<String, Map<String, String>> _strings = {
    'LOGIN': {
      'INVALID_LOGIN': 'Invalid username or password',
      'LOGIN_BUTTON': 'Log In',
      'LOGOUT_BUTTON': 'Log Out',
      'MISSING_PASSWORD': 'Password required',
      'MISSING_USERNAME': 'Username required',
      'PASSWORD_PROMPT': 'Password',
      'USERNAME_PROMPT': 'Username'
    },
    'MAIN': {'APP_TITLE': 'Caregiver', 'CARE_PLAN_NAME': 'Evelyn\'s Care'},
    'NAVBAR': {
      'ADD_BUTTON': 'Add',
      'HISTORY_BUTTON': 'History',
      'MANAGE_CARE_BUTTON': 'Manage',
      'SETTINGS_BUTTON': 'Settings',
      'TASKS_BUTTON': 'Tasks'
    },
    'NEW_EVENT': {
      'ADD_DETAIL': 'Add Detail',
      'SELECT_DETAIL_TYPE': 'Select Detail Type',
      'EVENT_NAME': 'Event Name',
      'SUBMIT': 'Submit',
      'UNASSIGNED': 'Unassigned'
    },
    'TASKS': {
      'ALL_TASKS_TAB': 'All Tasks',
      'COMPLETE_TASKS_HEADER': 'Complete Tasks',
      'INCOMPLETE_TASKS_HEADER': 'Incomplete Tasks',
      'MY_TASKS_TAB': 'My Tasks'
    },
    'HISTORY': {'TIMELINE_TAB': 'Timeline', 'CALENDAR_TAB': 'Calendar'},
    'MANAGE': {
      'PERSONAL_INFO_HEADER': 'Personal Information',
      'CHANGE_PICTURE': 'Change Picture',
      'LEGAL_NAME': 'Full Legal Name',
      'PREFERRED_NAME': 'Preferred Name',
      'PRONOUNS': 'Pronouns',
      'HOME_PHONE': 'Home Phone',
      'CELL_PHONE': 'Cell Phone',
      'RESIDENTIAL_ADDRESS': 'Residential Address',
      'MEDICAL_INFO_HEADER': 'Medical Information',
      'ALLERGIES': 'Allergies',
      'DIAGNOSES': 'Diagnoses',
      'MEDICATIONS': 'Medications + Frequency',
      'EMERGENCY_INFO_HEADER': 'Emergency Information',
      'EMERGENCY CONTACTS': 'Emergency Contacts',
      'LOCAL_FIRST_RESPONDERS': 'Local First Responders',
      'LOCAL_HOSPITAL': 'Local Hospital',
      'LOCAL_POLICE': 'Local Police Dept (Non-emergency)',
      'LOCAL_FIRE': 'Local Fire Dept (Non-emergency)',
      'PRIMARY_CARE_PROVIDER_HEADER': 'Doctor\'s Name',
      'PROVIDER_ADDRESS': 'Provider\'s Address',
      'PROVIDER_PHONE': 'Provider\'s Phone Number',
      'INSURANCE_CARD': 'Insurance Card',
      'NOTES': 'Notes',
      'ARCHIVE_PROFILE': 'Archive Profile'
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
