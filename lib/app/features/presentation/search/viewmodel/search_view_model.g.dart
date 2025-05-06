// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchViewModel on SearchViewModelBase, Store {
  late final _$moviesAtom =
      Atom(name: 'SearchViewModelBase.movies', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'SearchViewModelBase.isLoading', context: context);

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

  late final _$searchQueryAtom =
      Atom(name: 'SearchViewModelBase.searchQuery', context: context);

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

  late final _$currentPageAtom =
      Atom(name: 'SearchViewModelBase.currentPage', context: context);

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

  late final _$hasMorePagesAtom =
      Atom(name: 'SearchViewModelBase.hasMorePages', context: context);

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

  late final _$isLoadingMoreAtom =
      Atom(name: 'SearchViewModelBase.isLoadingMore', context: context);

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  late final _$searchMoviesAsyncAction =
      AsyncAction('SearchViewModelBase.searchMovies', context: context);

  @override
  Future<void> searchMovies() {
    return _$searchMoviesAsyncAction.run(() => super.searchMovies());
  }

  late final _$loadMoreMoviesAsyncAction =
      AsyncAction('SearchViewModelBase.loadMoreMovies', context: context);

  @override
  Future<void> loadMoreMovies() {
    return _$loadMoreMoviesAsyncAction.run(() => super.loadMoreMovies());
  }

  late final _$SearchViewModelBaseActionController =
      ActionController(name: 'SearchViewModelBase', context: context);

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$SearchViewModelBaseActionController.startAction(
        name: 'SearchViewModelBase.setSearchQuery');
    try {
      return super.setSearchQuery(value);
    } finally {
      _$SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearchQuery() {
    final _$actionInfo = _$SearchViewModelBaseActionController.startAction(
        name: 'SearchViewModelBase.clearSearchQuery');
    try {
      return super.clearSearchQuery();
    } finally {
      _$SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
isLoading: ${isLoading},
searchQuery: ${searchQuery},
currentPage: ${currentPage},
hasMorePages: ${hasMorePages},
isLoadingMore: ${isLoadingMore}
    ''';
  }
}
