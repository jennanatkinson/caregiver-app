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
    'MAIN': {'APP_TITLE': 'Caregiver'},
    'MANAGE': {
      'ARCHIVE_PROFILE': 'Archive Profile',
      'ALLERGIES': 'Allergies',
      'CELL_PHONE': 'Cell Phone',
      'CHANGE_PICTURE': 'Change Picture',
      'DIAGNOSES': 'Diagnoses',
      'EMERGENCY_INFO_HEADER': 'Emergency Information',
      'EMERGENCY CONTACTS': 'Emergency Contacts',
      'HOME_PHONE': 'Home Phone',
      'INSURANCE_CARD': 'Insurance Card',
      'LEGAL_NAME': 'Full Legal Name',
      'LOCAL_FIRE': 'Local Fire Dept (non-emergency)',
      'LOCAL_FIRST_RESPONDERS': 'Local First Responders',
      'LOCAL_HOSPITAL': 'Local Hospital',
      'LOCAL_POLICE': 'Local Police Dept (non-emergency)',
      'MANAGE_CARE': 'Manage Care',
      'MEDICAL_INFO_HEADER': 'Medical Information',
      'MEDICATIONS': 'Medications + Frequency',
      'NOTES': 'Notes',
      'PERSONAL_INFO_HEADER': 'Personal Information',
      'PREFERRED_NAME': 'Preferred Name',
      'PRIMARY_CARE_PROVIDER_HEADER': 'Doctor\'s Name',
      'PRONOUNS': 'Pronouns',
      'PROVIDER_ADDRESS': 'Provider\'s Address',
      'PROVIDER_PHONE': 'Provider\'s Phone Number',
      'RESIDENTIAL_ADDRESS': 'Residential Address'
    },
    'NAVBAR': {
      'ADD_BUTTON': 'Add',
      'HISTORY_BUTTON': 'History',
      'MANAGE_CARE_BUTTON': 'Manage',
      'SETTINGS_BUTTON': 'Settings',
      'TASKS_BUTTON': 'Tasks'
    },
    'NEW_EVENT': {
      'ADD_DETAIL': 'Add Detail',
      'ASSIGNED_PERSON': 'Assigned Person:',
      'DATE': 'Date:',
      'EVENT_NAME': 'Event Name',
      'TIME': 'Time:',
      'SELECT_DETAIL_TYPE': 'Select Detail Type',
      'SUBMIT': 'Submit',
      'UNASSIGNED': 'Unassigned'
    },
    'HISTORY': {'CALENDAR_TAB': 'Calendar', 'TIMELINE_TAB': 'Timeline'},
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