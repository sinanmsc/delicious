import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> with EquatableMixin {
  final Color primary;
  final Color btnPrimary;
  final Color txtInverse;
  final Color imgBack;
  final Color txtSubtle;

  AppColors({
    required this.primary,
    required this.btnPrimary,
    required this.txtInverse,
    required this.imgBack,
    required this.txtSubtle,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? btnPrimary,
    Color? txtInverse,
    Color? progressFill,
    Color? txtSubtle,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      btnPrimary: btnPrimary ?? this.btnPrimary,
      txtInverse: txtInverse ?? this.txtInverse,
      imgBack: progressFill ?? this.imgBack,
      txtSubtle: txtSubtle ?? this.txtSubtle,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      btnPrimary: Color.lerp(btnPrimary, other.btnPrimary, t)!,
      txtInverse: Color.lerp(txtInverse, other.txtInverse, t)!,
      imgBack: Color.lerp(imgBack, other.imgBack, t)!,
      txtSubtle: Color.lerp(txtSubtle, other.txtSubtle, t)!,
    );
  }

  @override
  List<Object?> get props => [
        primary,
        btnPrimary,
        imgBack,
        txtInverse,
        txtSubtle,
      ];
}
