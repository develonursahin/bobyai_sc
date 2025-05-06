import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:boby_movie_app/core/extensions/widgets/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnboardingMovieTitleWidget extends StatelessWidget {
  const OnboardingMovieTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final viewModel = getIt.get<OnboardingViewModel>();
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstCurve: Curves.easeInOut,
          secondCurve: Curves.easeInOut,
          crossFadeState:
              viewModel.isMovieSelectionComplete
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          firstChild: Text(
            AppStrings.continueToNext,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 24,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text(
                AppStrings.welcome,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppStrings.chooseMovies,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, color: AppColors.white),
              ),
            ],
          ),
        ).symmetricPadding(horizontal: 16);
      },
    );
  }
}
