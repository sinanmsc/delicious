import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_provider.g.dart';

@riverpod
class Menu extends _$Menu {
  late ImagePicker imagePicker;
  @override
  String? build() {
    imagePicker = ImagePicker();
    return null;
  }

  void getImage(String path) {
    state = path;
  }
}
