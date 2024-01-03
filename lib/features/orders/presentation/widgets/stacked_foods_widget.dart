import 'package:delicious/core/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class StackedFoodImages extends StatelessWidget {
  final double radius;
  final double firstPosition;
  final double secondPosition;
  const StackedFoodImages({
    super.key,
    required this.radius,
    required this.firstPosition,
    required this.secondPosition,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: colors.behindImage,
        ),
        Positioned(
          left: firstPosition,
          child: CircleAvatar(
            radius: radius,
            backgroundImage: const AssetImage('asset/order_images/food2.png'),
          ),
        ),
        Positioned(
          left: secondPosition,
          child: CircleAvatar(
            backgroundImage: const AssetImage('asset/order_images/food1.png'),
            radius: radius,
          ),
        ),
      ],
    );
  }
}
