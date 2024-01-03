import 'package:delicious/core/constants/order/order_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/orders/presentation/widgets/customer_details_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerDetails extends ConsumerWidget {
  const CustomerDetails({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomerDetailText(
          head: ref.watch(orderConstantsProvider).txtCustomerName,
          value: 'Mohammed Sinan C',
        ),
        SizedBox(height: spaces.space_200),
        CustomerDetailText(
          head: ref.watch(orderConstantsProvider).txtCustomerNo,
          value: '+918113905635',
        ),
        SizedBox(height: spaces.space_200),
        CustomerDetailText(
          head: ref.watch(orderConstantsProvider).txtDeliveryAddress,
          value: 'Levelx learning LLP, Hilite Business park Calicut, 787687',
        ),
      ],
    );
  }
}
