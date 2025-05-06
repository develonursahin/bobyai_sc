import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FreeTrialSwitch extends StatelessWidget {
  final bool isEnabled;
  final Color borderColor;
  final Color activeColor;
  final Function(bool) onChanged;

  const FreeTrialSwitch({
    super.key,
    required this.isEnabled,
    required this.borderColor,
    required this.activeColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Enable Free Trial',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          CupertinoSwitch(value: isEnabled, activeTrackColor: activeColor, onChanged: onChanged),
        ],
      ),
    );
  }
}
