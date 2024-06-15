import 'package:flutter/material.dart';
import 'package:islami/ui/utilits/app_colors.dart';

abstract class AppTheme {
  static const appBarTitleTextStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.accent);

  static const QuranTabTitleTextStyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.accent);

  static const TextStyle settingsTabTitle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.accent);

  static const TextStyle settingsOptionTitle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.normal, color: AppColors.accent);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primiary,
      dividerTheme: const DividerThemeData(
        thickness: 3,
        color: AppColors.primiary,
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: appBarTitleTextStyle),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accent,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 26)),
      textTheme: const TextTheme(
          bodySmall: settingsOptionTitle,
          bodyMedium: settingsTabTitle,
          displayMedium: QuranTabTitleTextStyle));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparent,
      primaryColor: AppColors.primaryDark,
      dividerTheme: const DividerThemeData(
        thickness: 3,
        color: AppColors.accentDark,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle:
              appBarTitleTextStyle.copyWith(color: AppColors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentDark,
          selectedIconTheme: IconThemeData(size: 32),
          unselectedIconTheme: IconThemeData(size: 26)),
      textTheme: TextTheme(
          bodySmall: settingsOptionTitle.copyWith(color: AppColors.white),
          bodyMedium: settingsTabTitle.copyWith(color: AppColors.white),
          displayMedium:
              QuranTabTitleTextStyle.copyWith(color: AppColors.white)));
}
