import 'package:boby_movie_app/app/features/presentation/movie/view/movie_view.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/view/onboarding_genres_view.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/view/onboarding_movies_view.dart';
import 'package:boby_movie_app/app/features/presentation/paywall/view/paywall_view.dart';
import 'package:boby_movie_app/app/features/presentation/splash/view/splash_view.dart';
import 'package:boby_movie_app/app/features/presentation/home/view/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: AppPaths.splash,
    routes: [
      GoRoute(path: AppPaths.splash, builder: (context, state) => const SplashView()),
      GoRoute(
        path: AppPaths.onboardingMovies,
        builder: (context, state) => const OnboardingMoviesView(),
      ),
      GoRoute(
        path: AppPaths.onboardingGenres,
        builder: (context, state) => const OnboardingGenresView(),
      ),
      GoRoute(path: AppPaths.home, builder: (context, state) => HomeView()),
      GoRoute(path: AppPaths.paywall, builder: (context, state) => PaywallView()),
      GoRoute(
        path: '/movie/:movieId',
        builder: (context, state) {
          final movieId = int.tryParse(state.pathParameters['movieId'] ?? '') ?? 0;
          return MovieView(movieId: movieId);
        },
      ),
    ],
  );
}

class AppPaths {
  static const splash = '/splash';
  static const onboardingMovies = '/onboarding_movies';
  static const onboardingGenres = '/onboarding_genres';
  static const home = '/home';
  static const paywall = '/paywall';
  static const movie = '/movie';
}
