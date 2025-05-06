import 'package:flutter/material.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';

class PaywallFooter extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onRestoreTap;
  final VoidCallback onPrivacyTap;

  const PaywallFooter({
    super.key,
    required this.onTermsTap,
    required this.onRestoreTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextButton(
          onPressed: onTermsTap,
          child: Text(AppStrings.terms, style: const TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: onRestoreTap,
          child: Text(AppStrings.restore, style: const TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: onPrivacyTap,
          child: Text(AppStrings.privacy, style: const TextStyle(color: Colors.white70)),
        ),
      ],
    );
  }
}
