import 'package:boby_movie_app/app/common/constants/app_theme_data.dart';
import 'package:boby_movie_app/app/common/functions/app_functions.dart';
import 'package:boby_movie_app/app/common/router/app_router.dart';
import 'package:boby_movie_app/core/keys/keys.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppFunctions.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Boby Movie App',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: AppKeys.scaffoldMessengerKey,
      theme: AppThemeData.themeData,
      routerConfig: AppRoutes.router,
    );
  }
}
