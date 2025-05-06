import 'package:mobx/mobx.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:boby_movie_app/app/common/constants/app_strings.dart';
import 'package:boby_movie_app/app/features/data/models/package_model.dart';
import 'package:boby_movie_app/app/features/data/repositories/package_repository.dart';

part 'paywall_view_model.g.dart';

enum SubscriptionType { weekly, monthly, yearly }

class PaywallViewModel extends _PaywallViewModelBase with _$PaywallViewModel {
  PaywallViewModel() {
    _setupReactions();
    init();
  }
}

abstract class _PaywallViewModelBase with Store {
  final _packageRepository = getIt<PackageRepository>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  ObservableList<PackageModel> packages = ObservableList<PackageModel>();

  @observable
  PackageModel? selectedPackage;

  @observable
  bool freeTrialEnabled = false;

  @observable
  bool isPro = false;

  @observable
  ObservableList<String> features = ObservableList.of([
    'Daily Movie Suggestions',
    'AI-Powered Movie Insights',
    'Personalized Watchlists',
    'Ad-Free Experience',
  ]);

  @observable
  ObservableList<List<bool>> featureMatrix = ObservableList.of([
    [true, true], // Daily Movie Suggestions
    [false, true], // AI-Powered Movie Insights
    [false, true], // Personalized Watchlists
    [false, true], // Ad-Free Experience
  ]);

  @computed
  ObservableList<String> get prices =>
      ObservableList.of(packages.map((p) => '${p.price} / ${p.durationInMonths} months').toList());

  @computed
  ObservableList<String> get priceNotes => ObservableList.of(
    packages.map((p) {
      final monthlyPrice = p.price / p.durationInMonths;
      return 'Only ${monthlyPrice.toStringAsFixed(2)} per month';
    }).toList(),
  );

  @computed
  String get mainButtonText => freeTrialEnabled ? AppStrings.freeTrial : AppStrings.subscribe;

  @computed
  List<bool> get proFeatures {
    if (selectedPackage == null) return List.filled(4, false);

    switch (selectedPackage!.id) {
      case 'weekly':
        return [true, true, false, false];
      case 'monthly':
        return [true, true, true, false];
      case 'yearly':
        return [true, true, true, true];
      default:
        return List.filled(4, false);
    }
  }

  void _setupReactions() {
    reaction((_) => selectedPackage?.id, (String? packageId) async {
      if (packageId != null) {
        await checkProStatus();
      }
    });
  }

  @action
  Future<void> init() async {
    isLoading = true;
    errorMessage = null;

    final result = await _packageRepository.getPackages();

    if (result.success) {
      runInAction(() {
        packages = ObservableList.of(result.data ?? []);
        if (packages.isNotEmpty) {
          selectedPackage = packages.first;
        }
      });
    } else {
      runInAction(() {
        errorMessage = result.message;
      });
    }

    isLoading = false;
  }

  @action
  void selectPackage(PackageModel package) {
    selectedPackage = package;
    if (freeTrialEnabled && !package.isPopular) {
      freeTrialEnabled = false;
    }
  }

  @action
  void toggleFreeTrial() {
    freeTrialEnabled = !freeTrialEnabled;
    if (freeTrialEnabled) {
      final popularPackage = packages.firstWhere((p) => p.isPopular);
      selectedPackage = popularPackage;
    }
  }

  @action
  Future<void> checkProStatus() async {
    final status = await _packageRepository.hasActivePackage();
    runInAction(() {
      isPro = status;
    });
  }

  @action
  Future<void> subscribe() async {
    if (selectedPackage == null) return;

    isLoading = true;
    await _packageRepository.saveSelectedPackage(selectedPackage!.id);
    await checkProStatus();
    isLoading = false;
  }
}
