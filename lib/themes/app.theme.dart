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
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.primary.withOpacity(0.1),
          filled: true,
          prefixIconColor: AppColors.secondary,
          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.secondary.withOpacity(0.5)),
          suffixIconColor: AppColors.secondary,
          errorStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.err),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primary,
          disabledColor: AppColors.disabled,
          height: 80,
        ),
        textTheme: const TextTheme(
          labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
          headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.primary),
          headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w200, color: AppColors.grey),
        ),
      );
}
