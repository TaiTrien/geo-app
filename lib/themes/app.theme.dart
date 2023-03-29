import 'package:flutter/material.dart';
import 'package:geo_app/variants/colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme(
          secondary: AppColors.secondary,
          background: AppColors.white,
          brightness: Brightness.light,
          error: AppColors.err,
          onBackground: AppColors.white,
          onError: AppColors.err,
          onPrimary: AppColors.primary,
          onSecondary: AppColors.secondary,
          onSurface: AppColors.white,
          primary: AppColors.primary,
          surface: AppColors.white.withOpacity(0.3),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primary,
          disabledColor: AppColors.disabled,
          height: 80,
        ),
        textTheme: const TextTheme(
          labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
        ),
      );
}
