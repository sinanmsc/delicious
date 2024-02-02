import 'package:freezed_annotation/freezed_annotation.dart';
part 'dish_entity.freezed.dart';

@freezed
class DishEntity with _$DishEntity {
  factory DishEntity({
    required String id,
    required String name,
    required String image,
    required String discription,
    required List<String> ingredients,
    required List<Map<String, dynamic>> variants,
    required List<Map<String, dynamic>> addons,
  }) = _DishEntity;
}
