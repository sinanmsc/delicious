import 'package:delicious/core/constants/banners/banners_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                color: Colors.blueGrey,
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
                      child: CustomTextField(
                        hintText: "text",
                      )),
                  SizedBox(
                    height: size.space_150 * 3,
                  ),
                  Row(
                    children: [
                      Text(ref.watch(offersConstantsProvider).txtdish),
                      const Spacer(),
                      const Icon(Icons.add),
                    ],
                  ),
                  ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(spaces.space_100),
                            boxShadow: boxShadow.overlay,
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://nationaltoday.com/wp-content/uploads/2022/10/456841065-min-1200x834.jpg"),
                            ),
                            title: Text(
                              "Item name",
                              style: typography.smallSemibold,
                            ),
                            subtitle: Row(
                              children: [
                                Container(
                                  height: size.space_125 * 2,
                                  width: size.space_300 * 2,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: const Color.fromARGB(
                                          31, 216, 216, 216),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Half",
                                    style: typography.smallSemibold,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  width: size.space_150,
                                ),
                                Container(
                                  child: Text(
                                    "Mayonise",
                                    style: typography.smallSemibold,
                                    textAlign: TextAlign.center,
                                  ),
                                  height: 20,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      color: const Color.fromARGB(
                                          31, 216, 216, 216),
                                      borderRadius: BorderRadius.circular(10)),
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
            ),
          )
        ],
      ),
    );
  }
}
