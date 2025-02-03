import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/features/movies/providers/movies_provider.dart';
import 'package:movies_series_app/presentation/widgets/custom_circular_progress.dart';
import 'package:movies_series_app/presentation/widgets/movies_widget.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MoviesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moviesProvider.notifier).getMoviesPopularList();
      ref.read(moviesProvider.notifier).getMoviesTopRatedList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Column(
              children: [
                Consumer(
                  builder: (builder, ref, child) {
                    final movieState = ref.watch(moviesProvider);
                    if (movieState.isLoading) {
                      return const CustomCircularProgress();
                    } else if (movieState.isError != null) {
                      return Text(movieState.isError!);
                    } else if (movieState.moviesPopular != null) {
                      final moviesPopular = movieState.moviesPopular!;
                      return Column(
                        children: [
                          Text(
                            'Most Popular Movies',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 20),
                          MoviesWidget(movies: moviesPopular),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                SizedBox(height: 40),
                Consumer(
                  builder: (builder, ref, child) {
                    final movieState = ref.watch(moviesProvider);
                    if (movieState.isLoading) {
                      return const CustomCircularProgress();
                    } else if (movieState.isError != null) {
                      return Text(movieState.isError!);
                    } else if (movieState.moviesTopRated != null) {
                      final moviesTopRated = movieState.moviesTopRated!;
                      return Column(
                        children: [
                          Text(
                            'Top Rated Movies',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 20),
                          MoviesWidget(movies: moviesTopRated),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
