import 'package:delicious/core/exceptions/base_exception.dart';

class InavlidTextException extends BaseException {
  InavlidTextException() : super('Name should not be embty , Try Again');
}
