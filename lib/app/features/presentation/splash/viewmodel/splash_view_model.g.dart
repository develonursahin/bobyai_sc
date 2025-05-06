// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on SplashViewModelBase, Store {
  late final _$isInitializedAtom =
      Atom(name: 'SplashViewModelBase.isInitialized', context: context);

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  late final _$nextRouteAtom =
      Atom(name: 'SplashViewModelBase.nextRoute', context: context);

  @override
  String get nextRoute {
    _$nextRouteAtom.reportRead();
    return super.nextRoute;
  }

  @override
  set nextRoute(String value) {
    _$nextRouteAtom.reportWrite(value, super.nextRoute, () {
      super.nextRoute = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('SplashViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
isInitialized: ${isInitialized},
nextRoute: ${nextRoute}
    ''';
  }
}
