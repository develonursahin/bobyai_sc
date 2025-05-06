// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingViewModel on OnboardingViewModelBase, Store {
  Computed<bool>? _$isMovieSelectionCompleteComputed;

  @override
  bool get isMovieSelectionComplete => (_$isMovieSelectionCompleteComputed ??=
          Computed<bool>(() => super.isMovieSelectionComplete,
              name: 'OnboardingViewModelBase.isMovieSelectionComplete'))
      .value;
  Computed<bool>? _$isGenreSelectionCompleteComputed;

  @override
  bool get isGenreSelectionComplete => (_$isGenreSelectionCompleteComputed ??=
          Computed<bool>(() => super.isGenreSelectionComplete,
              name: 'OnboardingViewModelBase.isGenreSelectionComplete'))
      .value;

  late final _$selectedMoviesAtom =
      Atom(name: 'OnboardingViewModelBase.selectedMovies', context: context);

  @override
  ObservableList<MovieModel> get selectedMovies {
    _$selectedMoviesAtom.reportRead();
    return super.selectedMovies;
  }

  @override
  set selectedMovies(ObservableList<MovieModel> value) {
    _$selectedMoviesAtom.reportWrite(value, super.selectedMovies, () {
      super.selectedMovies = value;
    });
  }

  late final _$selectedGenresAtom =
      Atom(name: 'OnboardingViewModelBase.selectedGenres', context: context);

  @override
  ObservableList<GenreModel> get selectedGenres {
    _$selectedGenresAtom.reportRead();
    return super.selectedGenres;
  }

  @override
  set selectedGenres(ObservableList<GenreModel> value) {
    _$selectedGenresAtom.reportWrite(value, super.selectedGenres, () {
      super.selectedGenres = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: 'OnboardingViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$moviesAtom =
      Atom(name: 'OnboardingViewModelBase.movies', context: context);

  @override
  ObservableList<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$genresAtom =
      Atom(name: 'OnboardingViewModelBase.genres', context: context);

  @override
  ObservableList<GenreModel> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(ObservableList<GenreModel> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  late final _$isLoadingMovieAtom =
      Atom(name: 'OnboardingViewModelBase.isLoadingMovie', context: context);

  @override
  bool get isLoadingMovie {
    _$isLoadingMovieAtom.reportRead();
    return super.isLoadingMovie;
  }

  @override
  set isLoadingMovie(bool value) {
    _$isLoadingMovieAtom.reportWrite(value, super.isLoadingMovie, () {
      super.isLoadingMovie = value;
    });
  }

  late final _$isLoadingGenreAtom =
      Atom(name: 'OnboardingViewModelBase.isLoadingGenre', context: context);

  @override
  bool get isLoadingGenre {
    _$isLoadingGenreAtom.reportRead();
    return super.isLoadingGenre;
  }

  @override
  set isLoadingGenre(bool value) {
    _$isLoadingGenreAtom.reportWrite(value, super.isLoadingGenre, () {
      super.isLoadingGenre = value;
    });
  }

  late final _$genreBackgroundImagesAtom = Atom(
      name: 'OnboardingViewModelBase.genreBackgroundImages', context: context);

  @override
  ObservableMap<int, String?> get genreBackgroundImages {
    _$genreBackgroundImagesAtom.reportRead();
    return super.genreBackgroundImages;
  }

  @override
  set genreBackgroundImages(ObservableMap<int, String?> value) {
    _$genreBackgroundImagesAtom.reportWrite(value, super.genreBackgroundImages,
        () {
      super.genreBackgroundImages = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('OnboardingViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$fetchMoviesAsyncAction =
      AsyncAction('OnboardingViewModelBase.fetchMovies', context: context);

  @override
  Future<void> fetchMovies() {
    return _$fetchMoviesAsyncAction.run(() => super.fetchMovies());
  }

  late final _$fetchGenreBackgroundImageAsyncAction = AsyncAction(
      'OnboardingViewModelBase.fetchGenreBackgroundImage',
      context: context);

  @override
  Future<void> fetchGenreBackgroundImage(int genreId) {
    return _$fetchGenreBackgroundImageAsyncAction
        .run(() => super.fetchGenreBackgroundImage(genreId));
  }

  late final _$fetchGenresAsyncAction =
      AsyncAction('OnboardingViewModelBase.fetchGenres', context: context);

  @override
  Future<void> fetchGenres() {
    return _$fetchGenresAsyncAction.run(() => super.fetchGenres());
  }

  @override
  String toString() {
    return '''
selectedMovies: ${selectedMovies},
selectedGenres: ${selectedGenres},
selectedIndex: ${selectedIndex},
movies: ${movies},
genres: ${genres},
isLoadingMovie: ${isLoadingMovie},
isLoadingGenre: ${isLoadingGenre},
genreBackgroundImages: ${genreBackgroundImages},
isMovieSelectionComplete: ${isMovieSelectionComplete},
isGenreSelectionComplete: ${isGenreSelectionComplete}
    ''';
  }
}
