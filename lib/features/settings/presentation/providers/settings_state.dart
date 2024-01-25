import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  factory SettingState({
    required String startingTime,
    required String closingTime,
    required int theme
  }) = _SettingState;

}
