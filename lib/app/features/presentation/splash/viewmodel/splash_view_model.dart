import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/common/router/app_router.dart';
import 'package:boby_movie_app/app/features/presentation/home/viewmodel/home_view_model.dart';
import 'package:boby_movie_app/app/features/presentation/onboarding/viewmodel/onboarding_view_model.dart';
import 'package:boby_movie_app/app/features/data/repositories/package_repository.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = SplashViewModelBase with _$SplashViewModel;

abstract class SplashViewModelBase with Store {
  final _packageRepository = getIt<PackageRepository>();

  @observable
  bool isInitialized = false;

  @observable
  String nextRoute = '';

  @action
  Future<void> init() async {
    // Home viewmodel'ı başlat
    getIt.get<HomeViewModel>().init();

    // Splash animasyonu için bekle
    await Future.delayed(const Duration(seconds: 2));

    // İlk açılış kontrolü
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstOpen = prefs.getBool('is_first_open') ?? true;

    if (isFirstOpen) {
      // Onboarding viewmodel'ı başlat
      getIt.get<OnboardingViewModel>().init();
      await prefs.setBool('is_first_open', false);
      nextRoute = AppPaths.onboardingMovies;
    } else {
      // Aktif paket kontrolü
      final hasActivePackage = await _packageRepository.hasActivePackage();
      if (!hasActivePackage) {
        nextRoute = AppPaths.paywall;
      } else {
        nextRoute = AppPaths.home;
      }
    }

    isInitialized = true;
  }
}
