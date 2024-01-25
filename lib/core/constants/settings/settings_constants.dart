import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'settings_constants.g.dart';

class SettingsConstants {
  final txtappbar = 'Settings';
  final txtmanage = 'Manage Account';
  final txtchangePassword = 'Change password';
  final txtchangeName = 'Change Name';
  final txtDarktheme = 'Dark Theme';
  final txtTiming = 'Waiting Time';
  final txtStartingTime = 'Opening time';
  final txtClosingTimme = 'Closing Time';
  final txtLogoutbutton = 'LOGOUT';
}

@riverpod
SettingsConstants settingsConstants(SettingsConstantsRef ref) {
  return SettingsConstants();
}
