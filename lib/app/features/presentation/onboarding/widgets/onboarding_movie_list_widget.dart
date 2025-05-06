import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/widgets/movie_poster_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:boby_movie_app/app/features/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:boby_movie_app/core/extensions/build_context_extensions.dart';

class OnboardingMovieListWidget extends StatelessWidget {
  const OnboardingMovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final viewModel = getIt<OnboardingViewModel>();
        return ListWheelScrollView.useDelegate(
          controller: viewModel.scrollController,
          squeeze: 0.99,
          magnification: 1.0,
          offAxisFraction: 0,
          overAndUnderCenterOpacity: 1,
          itemExtent: context.width * .5,
          diameterRatio: 5,
          physics: const FixedExtentScrollPhysics(),
          perspective: 0.003,
          clipBehavior: Clip.none,
          childDelegate: ListWheelChildLoopingListDelegate(
            children: List.generate(viewModel.movies.length, (index) {
              var movie = viewModel.movies[index];
              return RotatedBox(
                quarterTurns: 1,
                child: Observer(
                  builder: (_) {
                    final isSelected = viewModel.selectedMovies.contains(movie);
                    return MoviePosterBox(
                      imageUrl: movie.posterPath ?? '',
                      isSelected: isSelected,
                      size: context.width * 0.6,
                      onTap: () => viewModel.selectMovie(movie),
                    );
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
