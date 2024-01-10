import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  factory MenuState({
    required Map<String, String> incredients,
    required Map<String, String> variants,
    required Map<String, String> addons,
    required String dishImage,
    required String categoryImage,
  }) = _MenuState;
}
