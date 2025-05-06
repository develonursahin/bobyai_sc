// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$recommendedMoviesAtom =
      Atom(name: 'HomeViewModelBase.recommendedMovies', context: context);

  @override
  ObservableList<MovieModel> get recommendedMovies {
    _$recommendedMoviesAtom.reportRead();
    return super.recommendedMovies;
  }

  @override
  set recommendedMovies(ObservableList<MovieModel> value) {
    _$recommendedMoviesAtom.reportWrite(value, super.recommendedMovies, () {
      super.recommendedMovies = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: 'HomeViewModelBase.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: 'HomeViewModelBase.selectedCategory', context: context);

  @override
  GenreModel get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(GenreModel value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: 'HomeViewModelBase.categories', context: context);

  @override
  ObservableList<GenreModel> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<GenreModel> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$moviesAtom =
      Atom(name: 'HomeViewModelBase.movies', context: context);

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

  late final _$currentPageAtom =
      Atom(name: 'HomeViewModelBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingMoviesByGenreAtom =
      Atom(name: 'HomeViewModelBase.isLoadingMoviesByGenre', context: context);

  @override
  bool get isLoadingMoviesByGenre {
    _$isLoadingMoviesByGenreAtom.reportRead();
    return super.isLoadingMoviesByGenre;
  }

  @override
  set isLoadingMoviesByGenre(bool value) {
    _$isLoadingMoviesByGenreAtom
        .reportWrite(value, super.isLoadingMoviesByGenre, () {
      super.isLoadingMoviesByGenre = value;
    });
  }

  late final _$hasMorePagesAtom =
      Atom(name: 'HomeViewModelBase.hasMorePages', context: context);

  @override
  bool get hasMorePages {
    _$hasMorePagesAtom.reportRead();
    return super.hasMorePages;
  }

  @override
  set hasMorePages(bool value) {
    _$hasMorePagesAtom.reportWrite(value, super.hasMorePages, () {
      super.hasMorePages = value;
    });
  }

  late final _$movieIdAtom =
      Atom(name: 'HomeViewModelBase.movieId', context: context);

  @override
  int get movieId {
    _$movieIdAtom.reportRead();
    return super.movieId;
  }

  @override
  set movieId(int value) {
    _$movieIdAtom.reportWrite(value, super.movieId, () {
      super.movieId = value;
    });
  }

  late final _$isProAtom =
      Atom(name: 'HomeViewModelBase.isPro', context: context);

  @override
  bool get isPro {
    _$isProAtom.reportRead();
    return super.isPro;
  }

  @override
  set isPro(bool value) {
    _$isProAtom.reportWrite(value, super.isPro, () {
      super.isPro = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('HomeViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$checkProStatusAsyncAction =
      AsyncAction('HomeViewModelBase.checkProStatus', context: context);

  @override
  Future<void> checkProStatus() {
    return _$checkProStatusAsyncAction.run(() => super.checkProStatus());
  }

  late final _$getMovieRecommendationsAsyncAction = AsyncAction(
      'HomeViewModelBase.getMovieRecommendations',
      context: context);

  @override
  Future<void> getMovieRecommendations() {
    return _$getMovieRecommendationsAsyncAction
        .run(() => super.getMovieRecommendations());
  }

  late final _$refreshRecommendedMoviesAsyncAction = AsyncAction(
      'HomeViewModelBase.refreshRecommendedMovies',
      context: context);

  @override
  Future<void> refreshRecommendedMovies() {
    return _$refreshRecommendedMoviesAsyncAction
        .run(() => super.refreshRecommendedMovies());
  }

  late final _$getGenresAsyncAction =
      AsyncAction('HomeViewModelBase.getGenres', context: context);

  @override
  Future<void> getGenres() {
    return _$getGenresAsyncAction.run(() => super.getGenres());
  }

  late final _$getMoviesByGenreAsyncAction =
      AsyncAction('HomeViewModelBase.getMoviesByGenre', context: context);

  @override
  Future<void> getMoviesByGenre() {
    return _$getMoviesByGenreAsyncAction.run(() => super.getMoviesByGenre());
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.setSearchQuery');
    try {
      return super.setSearchQuery(query);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(GenreModel category) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.setSelectedCategory');
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recommendedMovies: ${recommendedMovies},
searchQuery: ${searchQuery},
selectedCategory: ${selectedCategory},
categories: ${categories},
movies: ${movies},
currentPage: ${currentPage},
isLoading: ${isLoading},
isLoadingMoviesByGenre: ${isLoadingMoviesByGenre},
hasMorePages: ${hasMorePages},
movieId: ${movieId},
isPro: ${isPro}
    ''';
  }
}
