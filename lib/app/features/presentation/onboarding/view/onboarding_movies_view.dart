import 'package:boby_movie_app/app/common/widgets/loader/app_circle_loader.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/widgets/onboarding_movie_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/common/router/app_router.dart';
import 'package:boby_movie_app/app/common/widgets/buttons/app_button.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/widgets/onboarding_movie_list_widget.dart';
import 'package:boby_movie_app/core/extensions/widgets/padding_extensions.dart';

class OnboardingMoviesView extends StatelessWidget {
  const OnboardingMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt.get<OnboardingViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OnboardingMovieTitleWidget(),
            Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: Observer(
                builder: (context) {
                  return viewModel.isLoadingMovie
                      ? const AppCircleLoader()
                      : const RotatedBox(
                        quarterTurns: 3,
                        child: OnboardingMovieListWidget(),
                      );
                },
              ),
            ),
            const Spacer(flex: 2),
            Observer(
              builder:
                  (_) => AppButton.fill(
                    text: AppStrings.continueButton,
                    onPressed:
                        viewModel.isMovieSelectionComplete
                            ? () {
                              context.go(AppPaths.onboardingGenres);
                            }
                            : null,
                    backgroundColor:
                        viewModel.isMovieSelectionComplete
                            ? AppColors.redLight
                            : AppColors.redDark,
                    height: 48,
                    borderRadius: 12,
                  ).symmetricPadding(horizontal: 16),
            ),
          ],
        ),
      ),
    );
  }
}
