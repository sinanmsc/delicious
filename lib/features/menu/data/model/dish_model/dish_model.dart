import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_model.freezed.dart';
part 'dish_model.g.dart';

@freezed
class DishModel with _$DishModel {
  DishModel._();

  factory DishModel({
    required String id,
    required String name,
    required String image,
    required String discription,
    required List<String> ingredients,
    required List<Map<String, dynamic>> variants,
    required List<Map<String, dynamic>> addons,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, Object?> json) =>
      _$DishModelFromJson(json);

  factory DishModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return DishModel.fromJson({...data!, 'id': snapshot.id});
  }

  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
