import 'package:delicious/core/constants/settings/settings_constants.dart';
import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/features/settings/presentation/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimingWidgets extends ConsumerWidget {
  const TimingWidgets({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    final boxShadow = AppTheme.of(context).boxShadow;
    return Column(
      children: [
        SizedBox(
          height: spaces.space_150,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ref.watch(settingsConstantsProvider).txtStartingTime,
              style: typography.smallSemibold,
            ),
            InkWell(
              onTap: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (BuildContext context, Widget? child) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: child!,
                    );
                  },
                );
                if (pickedTime != null && context.mounted) {
                  ref.read(settingsProvider.notifier).updateTime(
                      MaterialLocalizations.of(context)
                          .formatTimeOfDay(pickedTime));
                }
              },
              child: Container(
                width: spaces.space_900,
                height: spaces.space_400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(spaces.space_100),
                  boxShadow: boxShadow.overlay,
                ),
                child: Center(
                    child: Text(
                  ref.watch(settingsProvider).startingTime,
                  style: typography.smallSemibold,
                )),
              ),
            )
          ],
        ),
        SizedBox(
          height: spaces.space_200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ref.watch(settingsConstantsProvider).txtClosingTimme,
              style: typography.smallSemibold,
            ),
            InkWell(
              onTap: () async {
                final closing = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (BuildContext context, Widget? child) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: child!,
                    );
                  },
                );
                if (closing != null && context.mounted) {
                  ref.read(settingsProvider.notifier).closingTime(
                      MaterialLocalizations.of(context)
                          .formatTimeOfDay(closing));
                }
              },
              child: Container(
                width: spaces.space_900,
                height: spaces.space_400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(spaces.space_100),
                  boxShadow: boxShadow.overlay,
                ),
                child: Center(
                    child: Text(
                  ref.watch(settingsProvider).closingTime,
                  style: typography.smallSemibold,
                )),
              ),
            )
          ],
        ),
      ],
    );
  }
}
