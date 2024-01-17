import 'package:delicious/core/exceptions/base_exception.dart';

class CannotAddCategoryException extends BaseException {
  CannotAddCategoryException() : super('Can\'t add category , Try again');
}
