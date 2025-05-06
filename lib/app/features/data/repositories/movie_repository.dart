import 'package:boby_movie_app/app/features/data/datasources/remote/movie_datasource.dart';
import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:boby_movie_app/core/result/result.dart';

abstract class MovieRepository {
  Future<DataResult<List<MovieModel>>> getPopular({
    int page = 1,
    int? region,
    String language = "en_US",
  });

  Future<DataResult<List<MovieModel>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
    String language = "en_US",
  });

  Future<DataResult<List<MovieModel>>> getMovieRecommendations({
    required int movieId,
    int page = 1,
    String language = "en-US",
  });

  Future<DataResult<List<MovieModel>>> searchMovies({
    required String query,
    bool includeAdult = false,
    int page = 1,
    String language = "en-US",
  });

  Future<DataResult<MovieModel>> getMovieDetail({required int movieId, String language});

  Future<DataResult<Map<String, dynamic>>> getMovieImages({required int movieId});
}

final class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource _movieRemoteDatasource;

  MovieRepositoryImpl({required MovieRemoteDatasource movieRemoteDatasource})
    : _movieRemoteDatasource = movieRemoteDatasource;

  @override
  Future<DataResult<List<MovieModel>>> getPopular({
    int page = 1,
    int? region,
    String language = "en_US",
  }) async {
    var apiResponseModel = await _movieRemoteDatasource.getPopular(
      page: page,
      region: region,
      language: language,
    );
    if (!apiResponseModel.isSuccess) {
      return ErrorDataResult(message: apiResponseModel.error?.message ?? "");
    }
    if (apiResponseModel.data == null) {
      return ErrorDataResult(message: "No data found");
    }
    return SuccessDataResult(data: apiResponseModel.data!);
  }

  @override
  Future<DataResult<List<MovieModel>>> getMoviesByGenre({
    required int genreId,
    int page = 1,
    String language = "en_US",
  }) async {
    var apiResponseModel = await _movieRemoteDatasource.getMoviesByGenre(
      genreId: genreId,
      page: page,
      language: language,
    );
    if (!apiResponseModel.isSuccess) {
      return ErrorDataResult(message: apiResponseModel.error?.message ?? "");
    }
    if (apiResponseModel.data == null) {
      return ErrorDataResult(message: "No data found");
    }
    return SuccessDataResult(data: apiResponseModel.data!);
  }

  @override
  Future<DataResult<List<MovieModel>>> getMovieRecommendations({
    required int movieId,
    int page = 1,
    String language = "en-US",
  }) async {
    var apiResponseModel = await _movieRemoteDatasource.getMovieRecommendations(
      movieId: movieId,
      page: page,
      language: language,
    );
    if (!apiResponseModel.isSuccess) {
      return ErrorDataResult(message: apiResponseModel.error?.message ?? "");
    }
    if (apiResponseModel.data == null) {
      return ErrorDataResult(message: "No data found");
    }
    return SuccessDataResult(data: apiResponseModel.data!);
  }

  @override
  Future<DataResult<List<MovieModel>>> searchMovies({
    required String query,
    bool includeAdult = false,
    int page = 1,
    String language = "en-US",
  }) async {
    var apiResponseModel = await _movieRemoteDatasource.searchMovies(
      query: query,
      includeAdult: includeAdult,
      page: page,
      language: language,
    );
    if (!apiResponseModel.isSuccess) {
      return ErrorDataResult(message: apiResponseModel.error?.message ?? "");
    }
    if (apiResponseModel.data == null) {
      return ErrorDataResult(message: "No data found");
    }
    return SuccessDataResult(data: apiResponseModel.data!);
  }

  @override
  Future<DataResult<MovieModel>> getMovieDetail({
    required int movieId,
    String language = "en-US",
  }) async {
    final apiResponseModel = await _movieRemoteDatasource.getMovieDetail(
      movieId: movieId,
      language: language,
    );
    if (!apiResponseModel.isSuccess) {
      return ErrorDataResult(message: apiResponseModel.error?.message ?? "");
    }
    if (apiResponseModel.data == null) {
      return ErrorDataResult(message: "No data found");
    }
    return SuccessDataResult(data: apiResponseModel.data!);
  }

  @override
  Future<DataResult<Map<String, dynamic>>> getMovieImages({required int movieId}) async {
    final apiResponseModel = await _movieRemoteDatasource.getMovieImages(movieId: movieId);
    if (!apiResponseModel.isSuccess) {
      return ErrorDataResult(message: apiResponseModel.error?.message ?? "");
    }
    if (apiResponseModel.data == null) {
      return ErrorDataResult(message: "No data found");
    }
    return SuccessDataResult(data: apiResponseModel.data!);
  }
}
