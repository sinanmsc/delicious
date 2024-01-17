import 'package:delicious/core/constants/order/order_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/orders/presentation/widgets/customer_details_widget.dart';
import 'package:delicious/features/orders/presentation/widgets/item_container_widget.dart';
import 'package:delicious/features/orders/presentation/widgets/stacked_foods_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderDetails extends ConsumerWidget {
  static const routerPath = '/order_details';
  static const routerName = 'order_details';
  final String id;
  const OrderDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: colors.btnPrimary,
        surfaceTintColor: Colors.transparent,
        title: Text(
          id,
          style: typography.appbarTitle,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: colors.btnPrimary,
            iconTheme: const IconThemeData(color: Colors.white),
            expandedHeight: spaces.space_100 * 51,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: spaces.space_300, vertical: spaces.space_300),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: spaces.space_500),
                          child: StackedFoodImages(
                            radius: spaces.space_800,
                            firstPosition: spaces.space_250,
                            secondPosition: spaces.space_500,
                          ),
                        ),
                      ),
                      SizedBox(height: spaces.space_400),
                      const CustomerDetails(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ref.watch(orderConstantsProvider).txtOrderedItemHead,
                  style: typography.h500Normal,
                ),
                ListView.separated(
                  padding: EdgeInsets.only(top: spaces.space_150),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) => const ItemContainer(),
                  itemCount: 2,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
