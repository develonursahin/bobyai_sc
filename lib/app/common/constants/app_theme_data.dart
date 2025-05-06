import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

final class AppThemeData {
  static final ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.redLight),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    appBarTheme: _appBarTheme,
  );

  static const BottomNavigationBarThemeData _bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.gray,
        unselectedLabelStyle: TextStyle(
          color: AppColors.gray,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        selectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.black,
    centerTitle: false,
    elevation: 0,
    titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.white),
    scrolledUnderElevation: 0,
  );
}
