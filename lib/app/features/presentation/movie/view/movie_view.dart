import 'package:boby_movie_app/app/common/widgets/loader/app_circle_loader.dart';
import 'package:boby_movie_app/app/features/presentation/movie/viewmodel/movie_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/movie/widgets/movie_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';

class MovieView extends StatefulWidget {
  final int movieId;
  const MovieView({super.key, required this.movieId});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  void initState() {
    super.initState();
    getIt.get<MovieViewModel>().fetchMovieDetail(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          final viewModel = getIt.get<MovieViewModel>();
          if (viewModel.isLoading) {
            return const AppCircleLoader();
          }
          if (viewModel.movie == null) {
            return const Center(
              child: Text(
                AppStrings.movieNotFound,
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          final movie = viewModel.movie!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (viewModel.movieImages.isNotEmpty)
                  const MovieSliderWidget()
                else if (movie.backdropPath != null)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original${movie.backdropPath}',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                Text(
                  movie.title ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (movie.originalTitle != null &&
                    movie.originalTitle != movie.title)
                  Text(
                    movie.originalTitle!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                const SizedBox(height: 8),
                if (movie.releaseDate != null)
                  Text(
                    '${AppStrings.releaseDate}${movie.releaseDate}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                const SizedBox(height: 8),
                if (movie.voteAverage != null)
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${movie.voteAverage!.toStringAsFixed(1)} / 10',
                        style: const TextStyle(color: Colors.white),
                      ),
                      if (movie.voteCount != null)
                        Text(
                          '(${movie.voteCount}${AppStrings.votes})',
                          style: const TextStyle(color: Colors.white70),
                        ),
                    ],
                  ),
                if (movie.originalLanguage != null)
                  Text(
                    '${AppStrings.originalLanguage}${movie.originalLanguage!.toUpperCase()}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                if (movie.popularity != null)
                  Text(
                    '${AppStrings.popularity}${movie.popularity!.toStringAsFixed(1)}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                if (movie.adult != null)
                  Text(
                    '${AppStrings.adultContent}${movie.adult! ? AppStrings.yes : AppStrings.no}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                const SizedBox(height: 16),
                Text(
                  AppStrings.overview,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.overview ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
