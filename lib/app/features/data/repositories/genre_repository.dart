import 'package:boby_movie_app/app/features/data/datasources/remote/genre_datasource.dart';
import 'package:boby_movie_app/app/features/data/models/genre_model.dart';
import 'package:boby_movie_app/core/result/result.dart';

abstract class GenreRepository {
  Future<DataResult<List<GenreModel>>> getGenres({String language = "en"});
}

final class GenreRepositoryImpl extends GenreRepository {
  final GenreRemoteDatasource _genreRemoteDatasource;

  GenreRepositoryImpl({required GenreRemoteDatasource genreRemoteDatasource})
    : _genreRemoteDatasource = genreRemoteDatasource;

  @override
  Future<DataResult<List<GenreModel>>> getGenres({
    String language = "en",
  }) async {
    final response = await _genreRemoteDatasource.getGenres(language: language);
    if (!response.isSuccess) {
      return ErrorDataResult(message: response.error?.message ?? "");
    }
    if (response.data == null) {
      return ErrorDataResult(message: "No data found");
    }
    return SuccessDataResult(data: response.data!);
  }
}
