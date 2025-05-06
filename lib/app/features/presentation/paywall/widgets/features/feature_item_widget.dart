import 'package:flutter/material.dart';
import 'package:boby_movie_app/app/common/constants/app_colors.dart';

class FeatureItem extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final Color checkColor;
  final Color crossColor;

  const FeatureItem({
    super.key,
    required this.text,
    required this.isEnabled,
    required this.checkColor,
    required this.crossColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
