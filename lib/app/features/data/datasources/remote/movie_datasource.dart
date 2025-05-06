import 'package:boby_movie_app/app/common/config/config.dart';
import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:boby_movie_app/core/dio_manager/api_response_model.dart';
import 'package:boby_movie_app/core/dio_manager/dio_manager.dart';

abstract class MovieRemoteDatasource {
  Future<ApiResponseModel<List<MovieModel>>> getPopular({
    int page = 1,
    int? region,
    String language = "en_US",
  });

  Future<ApiResponseModel<List<MovieModel>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
    String language = "en_US",
  });

  Future<ApiResponseModel<List<MovieModel>>> getMovieRecommendations({
    required int movieId,
    int page = 1,
    String language = "en-US",
  });

  Future<ApiResponseModel<List<MovieModel>>> searchMovies({
    required String query,
    bool includeAdult = false,
    int page = 1,
    String language = "en-US",
  });

  Future<ApiResponseModel<MovieModel>> getMovieDetail({
    required int movieId,
    String language = "en-US",
  });

  Future<ApiResponseModel<Map<String, dynamic>>> getMovieImages({required int movieId});
}

final class MovieRemoteDatasourceImpl extends MovieRemoteDatasource {
  final DioApiManager _apiManager = DioApiManager(baseUrl: Config.apiBaseUrl);
  @override
  Future<ApiResponseModel<List<MovieModel>>> getPopular({
    int page = 1,
    int? region,
    String language = "en_US",
  }) async {
    final queryParams = <String, dynamic>{"page": page.toString(), "language": language};

    if (region != null) {
      queryParams["region"] = region.toString();
    }

    return await _apiManager.get(
      "/movie/popular",
      converter: (data) => (data['results'] as List).map((e) => MovieModel.fromMap(e)).toList(),
      queryParams: queryParams,
    );
  }

  @override
  Future<ApiResponseModel<List<MovieModel>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
    String language = "en_US",
  }) async {
    final queryParams = <String, dynamic>{
      "with_genres": genreId.toString(),
      "page": page.toString(),
      "language": language,
      "sort_by": "popularity.desc",
    };

    return await _apiManager.get(
      "/discover/movie",
      converter: (data) => (data['results'] as List).map((e) => MovieModel.fromMap(e)).toList(),
      queryParams: queryParams,
    );
  }

  @override
  Future<ApiResponseModel<List<MovieModel>>> getMovieRecommendations({
    required int movieId,
    int page = 1,
    String language = "en-US",
  }) async {
    final queryParams = <String, dynamic>{"page": page.toString(), "language": language};

    return await _apiManager.get(
      "/movie/$movieId/recommendations",
      converter: (data) => (data['results'] as List).map((e) => MovieModel.fromMap(e)).toList(),
      queryParams: queryParams,
    );
  }

  @override
  Future<ApiResponseModel<List<MovieModel>>> searchMovies({
    required String query,
    bool includeAdult = false,
    int page = 1,
    String language = "en-US",
  }) async {
    final queryParams = <String, dynamic>{
      "query": query,
      "include_adult": includeAdult.toString(),
      "language": language,
      "page": page.toString(),
    };

    return await _apiManager.get(
      "/search/movie",
      converter: (data) => (data['results'] as List).map((e) => MovieModel.fromMap(e)).toList(),
      queryParams: queryParams,
    );
  }

  @override
  Future<ApiResponseModel<MovieModel>> getMovieDetail({
    required int movieId,
    String language = "en-US",
  }) async {
    final queryParams = <String, dynamic>{"language": language};
    return await _apiManager.get(
      "/movie/$movieId",
      converter: (data) => MovieModel.fromMap(data),
      queryParams: queryParams,
    );
  }

  @override
  Future<ApiResponseModel<Map<String, dynamic>>> getMovieImages({required int movieId}) async {
    return await _apiManager.get(
      "/movie/$movieId/images",
      converter: (data) => data as Map<String, dynamic>,
    );
  }
}
