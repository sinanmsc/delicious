import 'dart:ui';

import 'package:delicious/features/settings/presentation/providers/settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'settings_provider.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  SettingState build() {
    return SettingState(startingTime: '', closingTime: '', theme: 0);
  }

  void updateTime(String time) {
    state = state.copyWith(startingTime: time);
  }

  void closingTime(String closetime) {
    state = state.copyWith(closingTime: closetime);
  }

  void switchtheme(int index) {
    state = state.copyWith(theme: index);
  }
}
