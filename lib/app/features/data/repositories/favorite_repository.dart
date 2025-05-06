import 'package:boby_movie_app/app/features/data/datasources/local/favorite_datasource.dart';
import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:boby_movie_app/core/result/result.dart';

abstract class FavoriteRepository {
  Future<DataResult<bool>> add(MovieModel movie);
  Future<DataResult<bool>> remove(int movieId);
  Future<DataResult<bool>> isFavorite(int movieId);
  Future<DataResult<List<MovieModel>>> getAll();
}

final class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDatasource _favoriteLocalDatasource;

  FavoriteRepositoryImpl({
    required FavoriteLocalDatasource favoriteLocalDatasource,
  }) : _favoriteLocalDatasource = favoriteLocalDatasource;

  @override
  Future<DataResult<bool>> add(MovieModel movie) async {
    try {
      final result = await _favoriteLocalDatasource.add(movie);
      return SuccessDataResult(data: result);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }

  @override
  Future<DataResult<bool>> remove(int movieId) async {
    try {
      final result = await _favoriteLocalDatasource.remove(movieId);
      return SuccessDataResult(data: result);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }

  @override
  Future<DataResult<bool>> isFavorite(int movieId) async {
    try {
      final result = await _favoriteLocalDatasource.isFavorite(movieId);
      return SuccessDataResult(data: result);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }

  @override
  Future<DataResult<List<MovieModel>>> getAll() async {
    try {
      final result = await _favoriteLocalDatasource.getAll();
      return SuccessDataResult(data: result);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }
}
