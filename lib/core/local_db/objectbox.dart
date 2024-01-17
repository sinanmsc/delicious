import 'package:delicious/features/menu/data/model/category_box_model.dart';
import 'package:delicious/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  static ObjectBox? _instance;

  static ObjectBox get instance {
    return _instance!;
  }

  /// The Store of this app.
  final Store store;
  late final Box<CategoryBoxModel> categoryBox;

  ObjectBox._create(this.store) {
    categoryBox = store.box<CategoryBoxModel>();
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<void> create() async {
    if (_instance == null) {
      final docsDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docsDir.path, "delicious"));
      _instance = ObjectBox._create(store);
    }
  }
}
