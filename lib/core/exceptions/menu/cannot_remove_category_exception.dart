import 'package:delicious/core/exceptions/base_exception.dart';

class CannotRemoveCategoryExceptiion extends BaseException {
  CannotRemoveCategoryExceptiion()
      : super('Can not remove category , Try again');
}
