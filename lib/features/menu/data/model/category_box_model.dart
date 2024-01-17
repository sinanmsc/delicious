import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryBoxModel {
  @Id()
  int id = 0;

  String? categoryId;
  String? name;
  String? image;
}
