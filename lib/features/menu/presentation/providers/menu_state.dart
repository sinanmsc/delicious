import 'package:delicious/features/menu/domain/entity/category_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  factory MenuState({
    required List<CategoryEntity> categoryList,
    required int currentCategory,
    required Map<String, String> incredients,
    required Map<String, String> variants,
    required Map<String, String> addons,
    required String dishImage,
    required String categoryImage,
    // required String oldCategoryImage,
    required bool isLoading,
  }) = _MenuState;
}
