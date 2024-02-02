import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicious/features/menu/data/datasource/dish_firestore/dish_firestore_datasource.dart';
import 'package:delicious/features/menu/data/model/dish_model/dish_model.dart';
import 'package:delicious/features/menu/presentation/providers/menu_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dish_firestore_datasource_impl.g.dart';

class DishFirestoreDatasourceImpl implements DishFirestoreDatasource {
  final String docId;
  final CollectionReference<DishModel> collection;
  DishFirestoreDatasourceImpl({required this.docId})
      : collection = FirebaseFirestore.instance
            .collection('category')
            .doc(docId)
            .collection('dishes')
            .withConverter(
              fromFirestore: DishModel.fromFirestore,
              toFirestore: (value, options) => value.toFirestore(),
            );

  @override
  Future<void> addDish(DishModel dish) async {
    await collection.add(dish);
  }

  @override
  Stream<List<DishModel>> getDish() {
    // TODO: implement getDish
    throw UnimplementedError();
  }

  @override
  Future<void> removeDish(DishModel dish) {
    // TODO: implement removeDish
    throw UnimplementedError();
  }

  @override
  Future<void> updateDish(DishModel dish) {
    // TODO: implement updateDish
    throw UnimplementedError();
  }

  @override
  Future<String> uploadDishImage(String name, String filePath) async {
    final storageRef = FirebaseStorage.instance.ref();

    await storageRef.child('DishFile/$name.png').putFile(File(filePath));
    return storageRef.child('DishFile/$name.png').getDownloadURL();
  }
}

@riverpod
DishFirestoreDatasource dishFirestoreDatasource(
    DishFirestoreDatasourceRef ref) {
  return DishFirestoreDatasourceImpl(
    docId: ref
        .watch(menuProvider)
        .categoryList[ref.watch(menuProvider).currentCategory]
        .id,
  );
}
