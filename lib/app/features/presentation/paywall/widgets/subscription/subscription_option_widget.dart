import 'package:flutter/material.dart';
import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/features/data/models/package_model.dart';

class SubscriptionOption extends StatelessWidget {
  final PackageModel package;
  final bool isSelected;
  final bool isBest;
  final String priceNote;
  final String price;
  final Color borderColor;
  final Function(PackageModel) onTap;

  const SubscriptionOption({
    super.key,
    required this.package,
    required this.isSelected,
    required this.isBest,
    required this.priceNote,
    required this.price,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? borderColor : AppColors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            onTap: () => onTap(package),
            leading: GestureDetector(
              onTap: () => onTap(package),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? borderColor : null,
                  border: Border.all(color: isSelected ? borderColor : AppColors.white, width: 2),
                ),
                child:
                    isSelected
                        ? Center(
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(color: borderColor, shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(Icons.check, color: Colors.white, size: 16),
                            ),
                          ),
                        )
                        : null,
              ),
            ),
            title: Row(
              children: [
                Text(
                  package.name,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            subtitle: Text(priceNote, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            trailing: Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        if (isBest)
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Best Value',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
