import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeatureIcon extends StatelessWidget {
  final bool isEnabled;
  final Color checkColor;
  final Color crossColor;

  const FeatureIcon({
    super.key,
    required this.isEnabled,
    required this.checkColor,
    required this.crossColor,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder:
          (_) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              if (child.key == const ValueKey('check')) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, isEnabled ? -1.6 : 1.6),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
                  child: child,
                );
              }
              return child;
            },
            child:
                isEnabled
                    ? Icon(
                      Icons.check_circle,
                      key: const ValueKey('check'),
                      color: checkColor,
                      size: 28,
                    )
                    : Icon(Icons.cancel, key: const ValueKey('cross'), color: crossColor, size: 28),
          ),
    );
  }
}
