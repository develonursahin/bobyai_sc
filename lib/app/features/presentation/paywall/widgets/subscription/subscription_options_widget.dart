import 'package:boby_movie_app/app/features/data/models/package_model.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/widgets/subscription/subscription_option_widget.dart';
import 'package:flutter/material.dart';

class SubscriptionOptions extends StatelessWidget {
  final PackageModel? selectedPackage;
  final List<PackageModel> packages;
  final Color borderColor;
  final Function(PackageModel) onPackageSelected;

  const SubscriptionOptions({
    super.key,
    required this.selectedPackage,
    required this.packages,
    required this.borderColor,
    required this.onPackageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ...packages.map((package) {
            return SubscriptionOption(
              package: package,
              isSelected: selectedPackage == package,
              isBest: package.isPopular,
              priceNote: 'Only \$${package.formattedWeeklyPrice} per week',
              price: '\$${package.price} / ${package.durationSuffix}',
              borderColor: borderColor,
              onTap: onPackageSelected,
            );
          }),
        ],
      ),
    );
  }
}
