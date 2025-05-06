import 'package:flutter/material.dart';
import 'package:boby_movie_app/core/extensions/widgets/padding_extensions.dart';

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final double fontSize;
  final Color textColor;
  final double iconSize;
  final double spacing;
  final EdgeInsets padding;

  const TitleWithIcon({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor = Colors.white,
    this.fontSize = 28,
    this.textColor = Colors.white,
    this.iconSize = 28,
    this.spacing = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing,
      children: [
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(icon, color: iconColor, size: iconSize),
      ],
    ).symmetricPadding(horizontal: padding.horizontal);
  }
}
