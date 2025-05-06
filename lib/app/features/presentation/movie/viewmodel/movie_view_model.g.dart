// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieViewModel on MovieViewModelBase, Store {
  late final _$movieAtom =
      Atom(name: 'MovieViewModelBase.movie', context: context);

  @override
  MovieModel? get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(MovieModel? value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'MovieViewModelBase.isLoading', context: context);

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

  late final _$movieImagesAtom =
      Atom(name: 'MovieViewModelBase.movieImages', context: context);

  @override
  List<String> get movieImages {
    _$movieImagesAtom.reportRead();
    return super.movieImages;
  }

  @override
  set movieImages(List<String> value) {
    _$movieImagesAtom.reportWrite(value, super.movieImages, () {
      super.movieImages = value;
    });
  }

  late final _$isLoadingImagesAtom =
      Atom(name: 'MovieViewModelBase.isLoadingImages', context: context);

  @override
  bool get isLoadingImages {
    _$isLoadingImagesAtom.reportRead();
    return super.isLoadingImages;
  }

  @override
  set isLoadingImages(bool value) {
    _$isLoadingImagesAtom.reportWrite(value, super.isLoadingImages, () {
      super.isLoadingImages = value;
    });
  }

  late final _$fetchMovieDetailAsyncAction =
      AsyncAction('MovieViewModelBase.fetchMovieDetail', context: context);

  @override
  Future<void> fetchMovieDetail(int movieId) {
    return _$fetchMovieDetailAsyncAction
        .run(() => super.fetchMovieDetail(movieId));
  }

  late final _$fetchMovieImagesAsyncAction =
      AsyncAction('MovieViewModelBase.fetchMovieImages', context: context);

  @override
  Future<void> fetchMovieImages(int movieId) {
    return _$fetchMovieImagesAsyncAction
        .run(() => super.fetchMovieImages(movieId));
  }

  @override
  String toString() {
    return '''
movie: ${movie},
isLoading: ${isLoading},
movieImages: ${movieImages},
isLoadingImages: ${isLoadingImages}
    ''';
  }
}
