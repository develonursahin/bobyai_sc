import 'package:flutter/material.dart';
import 'package:boby_movie_app/app/common/constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(scaffoldBackgroundColor: AppColors.black, useMaterial3: true);
  }
}
