import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SelectionIndicator extends StatelessWidget {
  const SelectionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(color: AppColors.redLight, shape: BoxShape.circle),
      child: const Icon(Icons.check, color: Colors.white, size: 18),
    );
  }
}
