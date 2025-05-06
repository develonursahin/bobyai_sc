import 'package:boby_movie_app/app/features/data/datasources/local/favorite_datasource.dart';
import 'package:boby_movie_app/app/features/data/datasources/local/package_datasource.dart';
import 'package:boby_movie_app/app/features/data/datasources/remote/genre_datasource.dart';
import 'package:boby_movie_app/app/features/data/datasources/remote/movie_datasource.dart';
import 'package:boby_movie_app/app/features/data/repositories/favorite_repository.dart';
import 'package:boby_movie_app/app/features/data/repositories/genre_repository.dart';
import 'package:boby_movie_app/app/features/data/repositories/movie_repository.dart';
import 'package:boby_movie_app/app/features/data/repositories/package_repository.dart';
import 'package:boby_movie_app/app/features/presentation/home/viewmodel/home_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/search/viewmodel/search_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/movie/viewmodel/movie_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/splash/viewmodel/splash_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/viewmodel/paywall_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// **Service provider class managing all dependencies**
final class ServiceLocator {
  /// **Main method to call to set up dependencies**
  void setup() {
    _setupRouter();
    _setupDataSource();
    _setupRepository();
    _setupViewModel();
  }

  /// **Router Dependency**
  void _setupRouter() {}

  /// **DataSource Dependency**
  void _setupDataSource() {
    // Local datasources
    getIt
      ..registerLazySingleton<FavoriteLocalDatasource>(
        () => FavoriteLocalDatasourceImpl(),
      )
      ..registerLazySingleton<PackageLocalDatasource>(
        () => PackageLocalDatasourceImpl(),
      )
      ..registerLazySingleton<GenreRemoteDatasource>(
        () => GenreRemoteDatasourceImpl(),
      )
      ..registerLazySingleton<MovieRemoteDatasource>(
        () => MovieRemoteDatasourceImpl(),
      );
  }

  /// **Repository Dependency**
  void _setupRepository() {
    // Favorite repository
    getIt
      ..registerLazySingleton<FavoriteRepository>(
        () => FavoriteRepositoryImpl(
          favoriteLocalDatasource: getIt<FavoriteLocalDatasource>(),
        ),
      )
      ..registerLazySingleton<PackageRepository>(
        () => PackageRepositoryImpl(
          packageLocalDatasource: getIt<PackageLocalDatasource>(),
        ),
      )
      // Genre repository
      ..registerLazySingleton<GenreRepository>(
        () => GenreRepositoryImpl(
          genreRemoteDatasource: getIt<GenreRemoteDatasource>(),
        ),
      )
      // Movie repository
      ..registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(
          movieRemoteDatasource: getIt<MovieRemoteDatasource>(),
        ),
      );
  }

  /// **BLoC, Cubit and ViewModel Dependency**
  void _setupViewModel() {
    getIt
      ..registerLazySingleton<SplashViewModel>(() => SplashViewModel())
      ..registerLazySingleton<HomeViewModel>(
        () => HomeViewModel(
          movieRepository: getIt<MovieRepository>(),
          genreRepository: getIt<GenreRepository>(),
          packageRepository: getIt<PackageRepository>(),
        ),
      )
      ..registerLazySingleton<SearchViewModel>(
        () => SearchViewModel(movieRepository: getIt<MovieRepository>()),
      )
      ..registerLazySingleton<MovieViewModel>(
        () => MovieViewModel(movieRepository: getIt<MovieRepository>()),
      )
      ..registerLazySingleton<OnboardingViewModel>(
        () => OnboardingViewModel(
          movieRepository: getIt<MovieRepository>(),
          genreRepository: getIt<GenreRepository>(),
        ),
      )
      ..registerLazySingleton(() => PaywallViewModel());
  }

  /// **Resets dependencies for Test and Debug**
  Future<void> reset() async {
    await getIt.reset();
    setup();
  }
}
