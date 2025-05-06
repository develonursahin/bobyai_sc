import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppCircleLoader extends StatelessWidget {
  const AppCircleLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2),
    );
  }
}
