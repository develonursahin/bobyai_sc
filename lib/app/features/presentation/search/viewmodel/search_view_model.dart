import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:boby_movie_app/app/features/data/repositories/movie_repository.dart';
import 'package:mobx/mobx.dart';
part 'search_view_model.g.dart';

class SearchViewModel = SearchViewModelBase with _$SearchViewModel;

abstract class SearchViewModelBase with Store {
  final MovieRepository _movieRepository;

  SearchViewModelBase({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @observable
  ObservableList<MovieModel> movies = ObservableList<MovieModel>.of([]);

  @observable
  bool isLoading = false;

  @observable
  String searchQuery = '';

  @observable
  int currentPage = 1;

  @observable
  bool hasMorePages = true;

  @observable
  bool isLoadingMore = false;

  @observable
  bool isListening = false;

  @action
  void setListening(bool value) {
    isListening = value;
  }

  @action
  void setSearchQuery(String value) {
    searchQuery = value;
    currentPage = 1;
    hasMorePages = true;
  }

  @action
  void clearSearchQuery() {
    searchQuery = '';
    currentPage = 1;
    hasMorePages = true;
    movies.clear();
  }

  @action
  Future<void> searchMovies() async {
    movies.clear();
    isLoading = true;
    currentPage = 1;

    final dataResult = await _movieRepository.searchMovies(
      query: searchQuery,
      page: currentPage,
      includeAdult: false,
    );

    if (!dataResult.success) {
      isLoading = false;
      return;
    }

    if (dataResult.data != null && dataResult.data!.isNotEmpty) {
      movies.addAll(dataResult.data!);
      hasMorePages = dataResult.data!.length >= 20;
      currentPage++;
    } else {
      hasMorePages = false;
    }

    isLoading = false;
  }

  @action
  Future<void> loadMoreMovies() async {
    if (!hasMorePages || isLoadingMore || isLoading) return;

    isLoadingMore = true;

    final dataResult = await _movieRepository.searchMovies(
      query: searchQuery,
      page: currentPage,
      includeAdult: false,
    );

    if (!dataResult.success) {
      isLoadingMore = false;
      return;
    }

    if (dataResult.data != null && dataResult.data!.isNotEmpty) {
      movies.addAll(dataResult.data!);
      hasMorePages = dataResult.data!.length >= 20;
      currentPage++;
    } else {
      hasMorePages = false;
    }

    isLoadingMore = false;
  }
}
