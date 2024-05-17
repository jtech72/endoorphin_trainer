import 'package:flutter/material.dart';
import 'app_colors.dart';
class AppThemes {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundBlack,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundBlack,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColors.yellowishWhite,
        filled: true,
      ),
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.yellow,
        onPrimary: AppColors.impgrey,
        surface: AppColors.backgroundBlack,
        onSurface: AppColors.backgroundBlack,
        primaryContainer: AppColors.impgrey,
        onPrimaryContainer: AppColors.impgrey,
      ),
      textTheme:  const TextTheme(
        headlineLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 24),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 24),
        headlineSmall: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 16),
        labelLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 14),
        labelMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto",
            color: AppColors.lightGrey,
            fontSize: 12),
        labelSmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 10),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 12),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 16),
        bodySmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            color: Colors.black,
            fontSize: 16),
        titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 16),
        titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 12),
        titleSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 36),
        displayLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 14),
        displayMedium: TextStyle(
            fontWeight: FontWeight.w300,
            fontFamily: "Roboto",
            color: AppColors.impgrey,
            fontSize: 12),
        displaySmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            color: AppColors.Black3,
            fontSize: 20),

      ));
}
//
