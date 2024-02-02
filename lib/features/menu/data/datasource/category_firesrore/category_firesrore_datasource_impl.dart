import 'dart:io';

import 'package:delicious/features/menu/data/datasource/category_firesrore/category_firesrore_datasource.dart';
import 'package:delicious/features/menu/data/model/category_model/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_firesrore_datasource_impl.g.dart';

class CategoryFirestoreDatasourceImpl implements CategoryFirestoreDatasource {
  final CollectionReference<CategoryModel> collection =
      FirebaseFirestore.instance.collection('category').withConverter(
          fromFirestore: CategoryModel.fromFirestore,
          toFirestore: (value, options) => value.toFirestore());

  @override
  Future<void> addCategory(CategoryModel category) async {
    await collection.add(category);
  }

  @override
  Future<void> removeCategory(CategoryModel category) async {
    await collection.doc(category.id).delete();
  }

  @override
  Future<void> updateCategory(CategoryModel categorModel) async {
    await collection.doc(categorModel.id).set(categorModel);
  }

  @override
  Stream<List<CategoryModel>> getCategory() async* {
    await for (var categoryList in collection.snapshots()) {
      yield [
        for (var category in categoryList.docs)
          CategoryModel(
            id: category.id,
            name: category.data().name,
            image: category.data().image,
          )
      ];
    }
  }

  //storage

  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadCatecoryImage(String name, String filePath) async {
    await storageRef.child('categoryFile/$name.png').putFile(File(filePath));
    return storageRef.child('categoryFile/$name.png').getDownloadURL();
  }
}

@riverpod
CategoryFirestoreDatasource categoryFirestoreDatasource(
    CategoryFirestoreDatasourceRef ref) {
  return CategoryFirestoreDatasourceImpl();
}
