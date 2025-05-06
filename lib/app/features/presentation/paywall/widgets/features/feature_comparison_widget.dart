import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/widgets/features/feature_icon_widget.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/widgets/features/feature_item_widget.dart';
import 'package:flutter/material.dart';

class FeatureComparison extends StatelessWidget {
  final List<String> features;
  final List<List<bool>> featureMatrix;
  final List<bool> proFeatures;
  final Color checkColor;
  final Color crossColor;

  const FeatureComparison({
    super.key,
    required this.features,
    required this.featureMatrix,
    required this.proFeatures,
    required this.checkColor,
    required this.crossColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    features.length,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: FeatureItem(
                        text: features[i],
                        isEnabled: featureMatrix[i][0],
                        checkColor: checkColor,
                        crossColor: crossColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  const Text(
                    'FREE',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(
                    featureMatrix.length,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: Offset(0.0, featureMatrix[i][0] ? -1.6 : 1.6),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(position: offsetAnimation, child: child),
                          );
                        },
                        child: FeatureIcon(
                          key: ValueKey('free_${i}_${featureMatrix[i][0]}'),
                          isEnabled: featureMatrix[i][0],
                          checkColor: checkColor,
                          crossColor: crossColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.redLight),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'PRO',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(
                      featureMatrix.length,
                      (i) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            final offsetAnimation = Tween<Offset>(
                              begin: Offset(0.0, proFeatures[i] ? -1.6 : 1.6),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(position: offsetAnimation, child: child),
                            );
                          },
                          child: FeatureIcon(
                            key: ValueKey('pro_${i}_${proFeatures[i]}'),
                            isEnabled: proFeatures[i],
                            checkColor: checkColor,
                            crossColor: crossColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
