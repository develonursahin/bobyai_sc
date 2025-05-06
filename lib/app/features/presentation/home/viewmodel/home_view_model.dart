import 'package:boby_movie_app/app/features/data/models/genre_model.dart';
import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:boby_movie_app/app/features/data/repositories/genre_repository.dart';
import 'package:boby_movie_app/app/features/data/repositories/movie_repository.dart';
import 'package:boby_movie_app/app/features/data/repositories/package_repository.dart';
import 'package:boby_movie_app/core/widgets/snackbar/app_snackbar.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final MovieRepository _movieRepository;
  final GenreRepository _genreRepository;
  final PackageRepository _packageRepository;

  HomeViewModelBase({
    required MovieRepository movieRepository,
    required GenreRepository genreRepository,
    required PackageRepository packageRepository,
  }) : _movieRepository = movieRepository,
       _genreRepository = genreRepository,
       _packageRepository = packageRepository {
    init();
  }

  @observable
  ObservableList<MovieModel> recommendedMovies = ObservableList.of([]);

  @observable
  String searchQuery = '';

  @observable
  GenreModel selectedCategory = GenreModel();

  @observable
  ObservableList<GenreModel> categories = ObservableList.of([]);

  @observable
  ObservableList<MovieModel> movies = ObservableList.of([]);

  @observable
  int currentPage = 1;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMoviesByGenre = false;

  @observable
  bool hasMorePages = true;

  @observable
  int movieId = 1233069;

  @observable
  bool isPro = false;

  @action
  Future<void> init() async {
    await checkProStatus();
    await getGenres();
    getMovieRecommendations();
    getMoviesByGenre();
  }

  @action
  Future<void> checkProStatus() async {
    isPro = await _packageRepository.hasActivePackage();
  }

  @action
  void setSearchQuery(String query) {
    searchQuery = query;
  }

  @action
  void setSelectedCategory(GenreModel category) {
    selectedCategory = category;
  }

  @action
  Future<void> getMovieRecommendations() async {
    if (isLoading || !hasMorePages) return;

    isLoading = true;
    var dataResult = await _movieRepository.getMovieRecommendations(
      movieId: movieId,
      page: currentPage,
    );
    isLoading = false;

    if (!dataResult.success) {
      AppSnackBar.show("Something went wrong. Please try again later.");
      return;
    }

    final movies = dataResult.data ?? [];
    if (movies.isEmpty) {
      hasMorePages = false;
      return;
    }

    recommendedMovies.addAll(movies);
    currentPage++;
  }

  @action
  Future<void> refreshRecommendedMovies() async {
    currentPage = 1;
    hasMorePages = true;
    recommendedMovies.clear();
    await getMovieRecommendations();
  }

  @action
  Future<void> getGenres() async {
    final dataResult = await _genreRepository.getGenres();
    if (!dataResult.success) {
      AppSnackBar.show("Something went wrong. Please try again later.");
      return;
    }
    selectedCategory = dataResult.data?.first ?? GenreModel();
    final genres = dataResult.data ?? [];
    categories.addAll(genres);
  }

  @action
  Future<void> getMoviesByGenre() async {
    if (isLoadingMoviesByGenre) return;
    movies.clear();
    isLoadingMoviesByGenre = true;
    final dataResult = await _movieRepository.getMoviesByGenre(genreId: selectedCategory.id ?? 0);
    if (!dataResult.success) {
      AppSnackBar.show("Something went wrong. Please try again later.");
      return;
    }
    movies.addAll(dataResult.data ?? []);
    isLoadingMoviesByGenre = false;
  }
}
