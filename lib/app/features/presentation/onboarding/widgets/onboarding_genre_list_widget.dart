import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:boby_movie_app/app/features/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/widgets/movie_genre_item_widget.dart';

class OnboardingGenreListWidget extends StatelessWidget {
  const OnboardingGenreListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final viewModel = getIt.get<OnboardingViewModel>();
        return GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ).copyWith(bottom: 100),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1.0,
          ),
          itemCount: viewModel.genres.length,
          itemBuilder: (_, index) {
            final genre = viewModel.genres[index];
            return Observer(
              builder: (_) {
                final isSelected = viewModel.selectedGenres.contains(genre);
                final backgroundImage =
                    viewModel.genreBackgroundImages[genre.id];
                return MovieGenreItem(
                  id: genre.id ?? 0,
                  name: genre.name ?? "",
                  isSelected: isSelected,
                  onTap: () => viewModel.selectGenre(genre),
                  isCircle: true,
                  backgroundImage: backgroundImage,
                );
              },
            );
          },
        );
      },
    );
  }
}
