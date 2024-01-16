import 'package:delicious/core/constants/banners/banners_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/banner/presentation/pages/sliver_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OfferPage extends ConsumerWidget {
  static const path = "/offers";
  static const name = "offer";
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final size = AppTheme.of(context).spaces;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.btnPrimary,
        title: Text(ref.watch(offersConstantsProvider).appbartitle,
            style: typography.appbarTitle),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (context, index) => SizedBox(
          height: size.space_150,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: colors.container,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://bdtask.com/blog/uploads/restaurant-food-combo-offers.jpg"),
                    fit: BoxFit.cover)),
            height: size.space_300 * 2,
            width: size.space_100 * 3,
          );
        },
        itemCount: 8,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Bannerpage.path);
        },
        backgroundColor: colors.btnPrimary,
        child: Icon(
          Icons.add,
          size: size.space_100 * 2,
        ),
      ),
    );
  }
}
