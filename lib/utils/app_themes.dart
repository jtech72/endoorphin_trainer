import 'package:flutter/material.dart';
import 'app_colors.dart';
class AppThemes {
  static ThemeData appTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundBlack,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColors.white,
        filled: true,
      ),
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.yellow,
        onPrimary: AppColors.white,
        background: AppColors.backgroundBlack,
        onBackground: AppColors.backgroundBlack,
        primaryContainer: AppColors.white,
        onPrimaryContainer: AppColors.white,
      ),
      textTheme:  const TextTheme(
        headlineLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 24),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 24),
        headlineSmall: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 16),
        labelLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 14),
        labelMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto",
            color: AppColors.lightGrey,
            fontSize: 12),
        labelSmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 10),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 12),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 16),
        bodySmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            color: Colors.black,
            fontSize: 16),
        titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 16),
        titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 12),
        titleSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
            color: AppColors.white,
            fontSize: 36),
      ));
}
//
