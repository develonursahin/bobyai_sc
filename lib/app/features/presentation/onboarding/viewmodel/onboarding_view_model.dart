import 'package:mobx/mobx.dart';
import 'package:flutter/widgets.dart';
import 'package:boby_movie_app/app/features/data/models/genre_model.dart';
import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:boby_movie_app/app/features/data/repositories/genre_repository.dart';
import 'package:boby_movie_app/app/features/data/repositories/movie_repository.dart';
import 'package:boby_movie_app/core/widgets/snackbar/app_snackbar.dart';

part 'onboarding_view_model.g.dart';

class OnboardingViewModel = OnboardingViewModelBase with _$OnboardingViewModel;

abstract class OnboardingViewModelBase with Store {
  final MovieRepository _movieRepository;
  final GenreRepository _genreRepository;

  OnboardingViewModelBase({
    required MovieRepository movieRepository,
    required GenreRepository genreRepository,
  }) : _movieRepository = movieRepository,
       _genreRepository = genreRepository;

  @observable
  ObservableList<MovieModel> selectedMovies = ObservableList<MovieModel>();

  @observable
  ObservableList<GenreModel> selectedGenres = ObservableList<GenreModel>();

  @observable
  int selectedIndex = 0;

  final FixedExtentScrollController scrollController = FixedExtentScrollController();

  @observable
  ObservableList<MovieModel> movies = ObservableList<MovieModel>();

  @observable
  ObservableList<GenreModel> genres = ObservableList<GenreModel>();

  @observable
  bool isLoadingMovie = false;

  @observable
  bool isLoadingGenre = false;

  @observable
  ObservableMap<int, String?> genreBackgroundImages = ObservableMap<int, String?>();

  @computed
  bool get isMovieSelectionComplete => selectedMovies.length == 3;

  @computed
  bool get isGenreSelectionComplete => selectedGenres.length == 2;

  int get initialIndex => movies.length ~/ 2;

  void initScrollPosition() {
    if (scrollController.hasClients) {
      scrollController.jumpToItem(initialIndex);
    }
  }

  @action
  Future<void> init() async {
    fetchMovies();
    fetchGenres();
  }

  void selectMovie(MovieModel movie) {
    if (selectedMovies.contains(movie)) {
      selectedMovies.remove(movie);
    } else {
      if (selectedMovies.length < 3) {
        selectedMovies.add(movie);
      }
    }
  }

  void selectGenre(GenreModel genre) {
    if (selectedGenres.contains(genre)) {
      selectedGenres.remove(genre);
    } else {
      if (selectedGenres.length < 2) {
        selectedGenres.add(genre);
      }
    }
  }

  @action
  Future<void> fetchMovies() async {
    isLoadingMovie = true;
    final result = await _movieRepository.getPopular(page: 1);
    isLoadingMovie = false;

    if (!result.success) {
      AppSnackBar.show("An error occurred while loading movies.");
      return;
    }

    if (result.data != null) {
      movies.clear();
      movies.addAll(result.data!);
      initScrollPosition();
    }
  }

  @action
  Future<void> fetchGenreBackgroundImage(int genreId) async {
    final result = await _movieRepository.getMoviesByGenre(genreId: genreId, page: 1);

    if (result.success && result.data != null && result.data!.isNotEmpty) {
      final movie = result.data!.first;
      genreBackgroundImages[genreId] = movie.backdropPath;
    }
  }

  @action
  Future<void> fetchGenres() async {
    isLoadingGenre = true;
    final result = await _genreRepository.getGenres();
    isLoadingGenre = false;

    if (!result.success) {
      AppSnackBar.show("An error occurred while loading genres.");
      return;
    }

    if (result.data != null) {
      genres.clear();
      genres.addAll(result.data!);

      for (var genre in genres) {
        if (genre.id != null) {
          fetchGenreBackgroundImage(genre.id!);
        }
      }
    }
  }
}
