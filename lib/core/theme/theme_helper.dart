import 'package:delicious/core/theme/extensions/colors_extension.dart';
import 'package:delicious/core/theme/extensions/space_extension.dart';
import 'package:delicious/core/theme/extensions/typography_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final BuildContext context;

  const AppTheme.of(this.context);

  AppColors get colors {
    return Theme.of(context).extension<AppColors>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
  }
}
