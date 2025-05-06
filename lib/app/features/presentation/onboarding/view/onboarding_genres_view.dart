import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/common/router/app_router.dart';
import 'package:boby_movie_app/app/common/widgets/buttons/app_button.dart';
import 'package:boby_movie_app/app/common/widgets/loader/app_circle_loader.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/widgets/onboarding_genre_list_widget.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/widgets/onboarding_genre_title_widget.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/viewmodel/paywall_view_model.dart';
import 'package:boby_movie_app/core/extensions/widgets/padding_extensions.dart';

class OnboardingGenresView extends StatelessWidget {
  const OnboardingGenresView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<OnboardingViewModel>();
    final paywallViewModel = PaywallViewModel();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OnboardingGenreTitleWidget(),
                Observer(
                  builder: (_) {
                    if (viewModel.isLoadingGenre) {
                      return const AppCircleLoader();
                    }
                    return const Expanded(child: OnboardingGenreListWidget());
                  },
                ),
              ],
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [AppColors.black, AppColors.black.withAlpha(0)],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Observer(
        builder: (context) {
          return AppButton.fill(
            text: AppStrings.continueButton,
            onPressed:
                viewModel.isGenreSelectionComplete
                    ? () {
                      if (paywallViewModel.isPro) {
                        context.go(AppPaths.home);
                      } else {
                        context.go(AppPaths.paywall);
                      }
                    }
                    : null,
          ).symmetricPadding(horizontal: 16);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
