import 'package:boby_movie_app/app/common/config/config.dart';
import 'package:boby_movie_app/app/common/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class AppFunctions {
  AppFunctions._();
  static final AppFunctions instance = AppFunctions._();
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Config.currentEnvironment = Environment.development;
    ServiceLocator().setup();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
