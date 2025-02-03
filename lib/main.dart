// ignore_for_file: avoid_print

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/core/constants/palette.dart';
import 'package:movies_series_app/presentation/screens/home_screen.dart';
import 'package:movies_series_app/router.dart';

Future<void> main() async {
  runZonedGuarded<void>(() async {
    final router = FluroRouter();
    RouterFluro().setupRouter(router);
    EquatableConfig.stringify = true;
    runApp(ProviderScope(child: MyApp(router: router)));
  }, (error, stack) {
    print(error.toString());
  });
}

class MyApp extends StatelessWidget {
  final FluroRouter router;
  const MyApp({
    required this.router,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies & Series App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Palette.primary,
          iconTheme: IconThemeData(color: Palette.white),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Palette.white,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Palette.primary,
          selectedItemColor: Palette.white,
          unselectedItemColor: Palette.grey,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: Palette.primary,
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      onGenerateRoute: router.generator,
    );
  }
}
