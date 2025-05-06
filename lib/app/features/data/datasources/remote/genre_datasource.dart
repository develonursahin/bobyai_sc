import 'package:boby_movie_app/app/common/config/config.dart';
import 'package:boby_movie_app/app/features/data/models/genre_model.dart';
import 'package:boby_movie_app/core/dio_manager/api_response_model.dart';
import 'package:boby_movie_app/core/dio_manager/dio_manager.dart';

abstract class GenreRemoteDatasource {
  Future<ApiResponseModel<List<GenreModel>>> getGenres({
    String language = "en",
  });
}

final class GenreRemoteDatasourceImpl extends GenreRemoteDatasource {
  final DioApiManager _dioApiManager = DioApiManager(
    baseUrl: Config.apiBaseUrl,
  );
  @override
  Future<ApiResponseModel<List<GenreModel>>> getGenres({
    String language = "en",
  }) async {
    return await _dioApiManager.get(
      "/genre/movie/list",
      converter:
          (data) =>
              (data['genres'] as List)
                  .map((e) => GenreModel.fromMap(e))
                  .toList(),
      queryParams: {"language": language},
    );
  }
}
