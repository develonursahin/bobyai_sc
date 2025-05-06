import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:boby_movie_app/app/common/router/app_router.dart';

class PaywallCloseButton extends StatelessWidget {
  const PaywallCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(Icons.close, color: Colors.white),
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            context.go(AppPaths.home);
          }
        },
      ),
    );
  }
}
