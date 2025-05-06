import 'package:boby_movie_app/app/common/constants/app_colors.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:boby_movie_app/core/extensions/widgets/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnboardingGenreTitleWidget extends StatelessWidget {
  const OnboardingGenreTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Observer(
        builder: (_) {
          final viewModel = getIt.get<OnboardingViewModel>();
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.easeInOut,
            crossFadeState:
                !viewModel.isGenreSelectionComplete
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
            firstChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.welcome,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                if (!viewModel.isGenreSelectionComplete)
                  const Text(
                    AppStrings.chooseGenres,
                    style: TextStyle(color: AppColors.white, fontSize: 24),
                  ),
              ],
            ),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.thankYou,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ).symmetricPadding(horizontal: 16);
        },
      ),
    );
  }
}
