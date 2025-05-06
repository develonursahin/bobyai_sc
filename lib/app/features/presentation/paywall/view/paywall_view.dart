import 'package:boby_movie_app/app/features/presentation/paywall/widgets/features/feature_comparison_widget.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/widgets/subscription/subscription_options_widget.dart';
import 'package:boby_movie_app/core/extensions/widgets/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/viewmodel/paywall_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/widgets/common/paywall_footer_widget.dart';
import 'package:boby_movie_app/app/common/widgets/buttons/app_button.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/widgets/common/auto_renewable_text_widget.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/widgets/common/close_button_widget.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/widgets/common/free_trial_switch_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:boby_movie_app/app/common/router/app_router.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/features/presentation/home/viewmodel/home_view_model.dart';

class PaywallView extends StatelessWidget {
  const PaywallView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = PaywallViewModel();

    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder:
              (_) => SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  children: [
                    const PaywallCloseButton(),
                    const Text(
                      AppStrings.appName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    FeatureComparison(
                      features: viewModel.features,
                      featureMatrix: viewModel.featureMatrix,
                      proFeatures: viewModel.proFeatures,
                      checkColor: AppColors.green,
                      crossColor: AppColors.white,
                    ),
                    FreeTrialSwitch(
                      isEnabled: viewModel.freeTrialEnabled,
                      borderColor: AppColors.redLight,
                      activeColor: AppColors.green,
                      onChanged: (_) => viewModel.toggleFreeTrial(),
                    ),
                    SubscriptionOptions(
                      selectedPackage: viewModel.selectedPackage,
                      packages: viewModel.packages,
                      borderColor: AppColors.redLight,
                      onPackageSelected: viewModel.selectPackage,
                    ),
                    AutoRenewableText(iconColor: AppColors.green),
                    AppButton.fill(
                      text: viewModel.mainButtonText,
                      onPressed: () async {
                        await viewModel.subscribe();
                        if (viewModel.isPro) {
                          await getIt.get<HomeViewModel>().checkProStatus();
                          if (context.mounted) {
                            context.go(AppPaths.home);
                          }
                        }
                      },
                      height: 56,
                      borderRadius: 12,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ).symmetricPadding(horizontal: 16, vertical: 8),
                    PaywallFooter(onTermsTap: () {}, onRestoreTap: () {}, onPrivacyTap: () {}),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
