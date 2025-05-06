// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paywall_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaywallViewModel on _PaywallViewModelBase, Store {
  Computed<ObservableList<String>>? _$pricesComputed;

  @override
  ObservableList<String> get prices =>
      (_$pricesComputed ??= Computed<ObservableList<String>>(() => super.prices,
              name: '_PaywallViewModelBase.prices'))
          .value;
  Computed<ObservableList<String>>? _$priceNotesComputed;

  @override
  ObservableList<String> get priceNotes => (_$priceNotesComputed ??=
          Computed<ObservableList<String>>(() => super.priceNotes,
              name: '_PaywallViewModelBase.priceNotes'))
      .value;
  Computed<String>? _$mainButtonTextComputed;

  @override
  String get mainButtonText =>
      (_$mainButtonTextComputed ??= Computed<String>(() => super.mainButtonText,
              name: '_PaywallViewModelBase.mainButtonText'))
          .value;
  Computed<List<bool>>? _$proFeaturesComputed;

  @override
  List<bool> get proFeatures =>
      (_$proFeaturesComputed ??= Computed<List<bool>>(() => super.proFeatures,
              name: '_PaywallViewModelBase.proFeatures'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_PaywallViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_PaywallViewModelBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$packagesAtom =
      Atom(name: '_PaywallViewModelBase.packages', context: context);

  @override
  ObservableList<PackageModel> get packages {
    _$packagesAtom.reportRead();
    return super.packages;
  }

  @override
  set packages(ObservableList<PackageModel> value) {
    _$packagesAtom.reportWrite(value, super.packages, () {
      super.packages = value;
    });
  }

  late final _$selectedPackageAtom =
      Atom(name: '_PaywallViewModelBase.selectedPackage', context: context);

  @override
  PackageModel? get selectedPackage {
    _$selectedPackageAtom.reportRead();
    return super.selectedPackage;
  }

  @override
  set selectedPackage(PackageModel? value) {
    _$selectedPackageAtom.reportWrite(value, super.selectedPackage, () {
      super.selectedPackage = value;
    });
  }

  late final _$freeTrialEnabledAtom =
      Atom(name: '_PaywallViewModelBase.freeTrialEnabled', context: context);

  @override
  bool get freeTrialEnabled {
    _$freeTrialEnabledAtom.reportRead();
    return super.freeTrialEnabled;
  }

  @override
  set freeTrialEnabled(bool value) {
    _$freeTrialEnabledAtom.reportWrite(value, super.freeTrialEnabled, () {
      super.freeTrialEnabled = value;
    });
  }

  late final _$isProAtom =
      Atom(name: '_PaywallViewModelBase.isPro', context: context);

  @override
  bool get isPro {
    _$isProAtom.reportRead();
    return super.isPro;
  }

  @override
  set isPro(bool value) {
    _$isProAtom.reportWrite(value, super.isPro, () {
      super.isPro = value;
    });
  }

  late final _$featuresAtom =
      Atom(name: '_PaywallViewModelBase.features', context: context);

  @override
  ObservableList<String> get features {
    _$featuresAtom.reportRead();
    return super.features;
  }

  @override
  set features(ObservableList<String> value) {
    _$featuresAtom.reportWrite(value, super.features, () {
      super.features = value;
    });
  }

  late final _$featureMatrixAtom =
      Atom(name: '_PaywallViewModelBase.featureMatrix', context: context);

  @override
  ObservableList<List<bool>> get featureMatrix {
    _$featureMatrixAtom.reportRead();
    return super.featureMatrix;
  }

  @override
  set featureMatrix(ObservableList<List<bool>> value) {
    _$featureMatrixAtom.reportWrite(value, super.featureMatrix, () {
      super.featureMatrix = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_PaywallViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$checkProStatusAsyncAction =
      AsyncAction('_PaywallViewModelBase.checkProStatus', context: context);

  @override
  Future<void> checkProStatus() {
    return _$checkProStatusAsyncAction.run(() => super.checkProStatus());
  }

  late final _$subscribeAsyncAction =
      AsyncAction('_PaywallViewModelBase.subscribe', context: context);

  @override
  Future<void> subscribe() {
    return _$subscribeAsyncAction.run(() => super.subscribe());
  }

  late final _$_PaywallViewModelBaseActionController =
      ActionController(name: '_PaywallViewModelBase', context: context);

  @override
  void selectPackage(PackageModel package) {
    final _$actionInfo = _$_PaywallViewModelBaseActionController.startAction(
        name: '_PaywallViewModelBase.selectPackage');
    try {
      return super.selectPackage(package);
    } finally {
      _$_PaywallViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFreeTrial() {
    final _$actionInfo = _$_PaywallViewModelBaseActionController.startAction(
        name: '_PaywallViewModelBase.toggleFreeTrial');
    try {
      return super.toggleFreeTrial();
    } finally {
      _$_PaywallViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
packages: ${packages},
selectedPackage: ${selectedPackage},
freeTrialEnabled: ${freeTrialEnabled},
isPro: ${isPro},
features: ${features},
featureMatrix: ${featureMatrix},
prices: ${prices},
priceNotes: ${priceNotes},
mainButtonText: ${mainButtonText},
proFeatures: ${proFeatures}
    ''';
  }
}
