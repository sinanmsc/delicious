import 'package:delicious/core/constants/banners/banners_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Pinnedsliver extends ConsumerWidget {
  const Pinnedsliver({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SliverAppBar(
          pinned: true,
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate((context, index) => Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(ref.watch(offersConstantsProvider).txtdish),
                    const Spacer(),
                    const Icon(Icons.add),
                  ],
                ),
              )),
          itemExtent: 50,
        )
      ],
    );
  }
}
