import 'package:flutter/material.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';

class AutoRenewableText extends StatelessWidget {
  final Color iconColor;

  const AutoRenewableText({super.key, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.autorenew, color: iconColor, size: 16),
        const SizedBox(width: 4),
        Text(
          AppStrings.autoRenewableInfo,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
