import 'package:delicious/core/exceptions/base_exception.dart';

class CannotAddDishCategory extends BaseException {
  CannotAddDishCategory() : super('Can not add dishes now, Try again');
}
