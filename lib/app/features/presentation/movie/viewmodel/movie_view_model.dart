import 'package:mobx/mobx.dart';
import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:boby_movie_app/app/features/data/repositories/movie_repository.dart';

part 'movie_view_model.g.dart';

class MovieViewModel = MovieViewModelBase with _$MovieViewModel;

abstract class MovieViewModelBase with Store {
  final MovieRepository _movieRepository;

  MovieViewModelBase({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @observable
  MovieModel? movie;

  @observable
  bool isLoading = false;

  @observable
  List<String> movieImages = [];

  @observable
  bool isLoadingImages = false;

  @action
  Future<void> fetchMovieDetail(int movieId) async {
    if (isLoading) return;
    isLoading = true;
    final result = await _movieRepository.getMovieDetail(movieId: movieId);
    isLoading = false;
    if (result.success && result.data != null) {
      movie = result.data;
      await fetchMovieImages(movieId);
    }
  }

  @action
  Future<void> fetchMovieImages(int movieId) async {
    if (isLoadingImages) return;
    isLoadingImages = true;
    final result = await _movieRepository.getMovieImages(movieId: movieId);
    isLoadingImages = false;
    if (result.success && result.data != null) {
      final backdrops = (result.data!['backdrops'] as List<dynamic>?) ?? [];
      final posters = (result.data!['posters'] as List<dynamic>?) ?? [];

      movieImages = [
        ...backdrops.map((e) => e['file_path'] as String).take(5),
        ...posters.map((e) => e['file_path'] as String).take(5),
      ];
    }
  }
}
