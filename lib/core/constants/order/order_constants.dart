import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_constants.g.dart';

class OrderConstants {
  final txtAppbarTitle = 'Orders';
  final txtCustomerName = 'Customer name';
  final txtCustomerNo = 'Customer number';
  final txtDeliveryAddress = 'Delivery address';
  final txtOrderedItemHead = 'Ordered Items';
  final txtQuantity = 'Quantity';
  final txtSearch = 'Quantity';
}

@riverpod
OrderConstants orderConstants(OrderConstantsRef ref) {
  return OrderConstants();
}
