import 'package:delicious/core/exceptions/base_exception.dart';

class InavlidTextException extends BaseException {
  InavlidTextException() : super('Text Field should not be embty , Try Again');
}
