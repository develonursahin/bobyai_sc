import 'dart:convert';

import 'package:boby_movie_app/app/features/data/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoriteLocalDatasource {
  Future<bool> add(MovieModel movie);
  Future<bool> remove(int movieId);
  Future<bool> isFavorite(int movieId);
  Future<List<MovieModel>> getAll();
}

final class FavoriteLocalDatasourceImpl implements FavoriteLocalDatasource {
  final String _favoritesKey = 'favorites';

  @override
  Future<bool> add(MovieModel movie) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];

      // Check if movie is already in favorites
      final bool isAlreadyInFavorites = favorites.any((favorite) {
        final Map<String, dynamic> favoriteMap = jsonDecode(favorite);
        return favoriteMap['id'] == movie.id;
      });

      if (isAlreadyInFavorites) {
        return true; // Movie already exists in favorites
      }

      // Convert movie to JSON string and add to favorites
      final String movieJson = movie.toJson();

      favorites.add(movieJson);
      return await prefs.setStringList(_favoritesKey, favorites);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> remove(int movieId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];

      // Filter out the movie with the given ID
      final List<String> updatedFavorites =
          favorites.where((favorite) {
            final Map<String, dynamic> favoriteMap = jsonDecode(favorite);
            return favoriteMap['id'] != movieId;
          }).toList();

      // If no changes were made, return false
      if (favorites.length == updatedFavorites.length) {
        return false;
      }

      return await prefs.setStringList(_favoritesKey, updatedFavorites);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];

      return favorites.any((favorite) {
        final Map<String, dynamic> favoriteMap = jsonDecode(favorite);
        return favoriteMap['id'] == movieId;
      });
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<MovieModel>> getAll() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> favoritesJson =
          prefs.getStringList(_favoritesKey) ?? [];

      return favoritesJson.map((favoriteJson) {
        final Map<String, dynamic> favoriteMap = jsonDecode(favoriteJson);
        return MovieModel.fromMap(favoriteMap);
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
