import 'package:delicious/core/constants/banners/banners_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Bannerpage extends ConsumerWidget {
  const Bannerpage({super.key});
  static const path = "/banner";
  static const name = "banner";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    final boxShadow = AppTheme.of(context).boxShadow;
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final size = AppTheme.of(context).spaces;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: size.space_400,
                width: size.space_250,
                // color: Colors.blueGrey,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://img.freepik.com/free-photo/chicken-wings-barbecue-sweetly-sour-sauce-picnic-summer-menu-tasty-food-top-view-flat-lay_2829-6471.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: colors.btnPrimary,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(size.space_125),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ref.watch(offersConstantsProvider).txtbanner,
                      style: typography.h400),
                  SizedBox(
                    height: size.space_150,
                  ),
                  SizedBox(
                      height: size.space_125 * 6.5,
                      width: size.space_500 * 10,
                      child: const CustomTextField(
                        hintText: "text",
                      )),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: FloatingHeader(ref),
            pinned: true,
          ),
          SliverList.separated(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(spaces.space_100),
                    boxShadow: boxShadow.overlay,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwBTLWb877Z5NDgly1RzaJ4UawYoJHPiJKscuuxIfC_1P_1BXkyXn1m2AQ1WvS9hkCj8I&usqp=CAU"),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ref.watch(offersConstantsProvider).txtitem,
                          style: typography.h400,
                        ),
                        SizedBox(
                          height: size.space_100,
                        )
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Container(
                          height: size.space_150 * 2,
                          width: size.space_150 * 4,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              color: const Color.fromARGB(31, 216, 216, 216),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            ref.watch(offersConstantsProvider).txthalf,
                            style: typography.smallSemibold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: size.space_300,
                        ),
                        Container(
                          height: size.space_150 * 2,
                          width: size.space_150 * 6,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              color: const Color.fromARGB(31, 216, 216, 216),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            ref.watch(offersConstantsProvider).txtmayo,
                            style: typography.smallSemibold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.delete),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 10)
        ],
      ),
    );
  }
}

class FloatingHeader extends SliverPersistentHeaderDelegate {
  final WidgetRef ref;

  FloatingHeader(this.ref);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = AppTheme.of(context).spaces;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 42,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 229, 229, 229),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: [
                Text(ref.watch(offersConstantsProvider).txtdish),
                const Spacer(),
                const Icon(Icons.add),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.space_100,
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;
}
