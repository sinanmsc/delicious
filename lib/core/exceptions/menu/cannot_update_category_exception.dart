import 'package:delicious/core/exceptions/base_exception.dart';

class CannotUpdateCategoryException extends BaseException {
  CannotUpdateCategoryException() : super('Can not update this category now');
}
