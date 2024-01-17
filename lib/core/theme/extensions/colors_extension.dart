import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color btnPrimary;
  final Color txtInverse;
  final Color imgBack;
  final Color txtSubtle;
  final Color backgroundLight;
  final Color behindImage;

  final Color container;

  AppColors({
    required this.primary,
    required this.btnPrimary,
    required this.txtInverse,
    required this.imgBack,
    required this.txtSubtle,
    required this.backgroundLight,
    required this.behindImage,
    required this.container,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? btnPrimary,
    Color? txtInverse,
    Color? imgBack,
    Color? txtSubtle,
    Color? backgroundLight,
    Color? behindImage,
    Color? container,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      btnPrimary: btnPrimary ?? this.btnPrimary,
      txtInverse: txtInverse ?? this.txtInverse,
      imgBack: imgBack ?? this.imgBack,
      txtSubtle: txtSubtle ?? this.txtSubtle,
      backgroundLight: backgroundLight ?? this.backgroundLight,
      behindImage: behindImage ?? this.behindImage,
      container: container ?? this.container,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      container: Color.lerp(container, other.container, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      btnPrimary: Color.lerp(btnPrimary, other.btnPrimary, t)!,
      txtInverse: Color.lerp(txtInverse, other.txtInverse, t)!,
      imgBack: Color.lerp(imgBack, other.imgBack, t)!,
      txtSubtle: Color.lerp(txtSubtle, other.txtSubtle, t)!,
      backgroundLight: Color.lerp(backgroundLight, other.backgroundLight, t)!,
      behindImage: Color.lerp(behindImage, other.behindImage, t)!,
    );

    // primary: Color.lerp(primary, other.primary, t)!,
    // btnPrimary: Color.lerp(btnPrimary, other.btnPrimary, t)!,
    // txtInverse: Color.lerp(txtInverse, other.txtInverse, t)!,
    // imgBack: Color.lerp(imgBack, other.imgBack, t)!,
    // txtSubtle: Color.lerp(txtSubtle, other.txtSubtle, t)!,
    // backgroundLight: Color.lerp(backgroundLight, other.backgroundLight, t)!,
    // container: Color.lerp(container, other.container, t)!);
  }
}
