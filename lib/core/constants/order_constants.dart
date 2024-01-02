import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_constants.g.dart';

class OrderConstants{
  final txtappbarTitle = 'Orders';
}

@riverpod
OrderConstants orderConstants(OrderConstantsRef ref) {
  return OrderConstants();
}