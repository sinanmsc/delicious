import 'package:delicious/core/exceptions/base_exception.dart';

class CannotGetCategoryException extends BaseException {
  CannotGetCategoryException()
      : super('Can not get categorys,Please try again');
}
