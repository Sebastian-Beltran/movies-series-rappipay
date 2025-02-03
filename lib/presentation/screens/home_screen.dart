import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/presentation/screens/movies/movies_screen.dart';
import 'package:movies_series_app/presentation/screens/search/search_screen.dart';
import 'package:movies_series_app/presentation/screens/series/series_screen.dart';
import 'package:movies_series_app/presentation/widgets/custom_app_bar.dart';
import 'package:movies_series_app/presentation/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: IndexedStack(
                index: currentIndex,
                children: [
                  MoviesScreen(),
                  SeriesScreen(),
                  SearchScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
