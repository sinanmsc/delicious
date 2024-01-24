import 'package:delicious/core/exceptions/base_exception.dart';

class CannotLoginException extends BaseException {
  CannotLoginException() : super('Can not login now, Try again');
}
