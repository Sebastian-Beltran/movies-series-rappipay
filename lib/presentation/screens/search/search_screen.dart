import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/core/constants/palette.dart';
import 'package:movies_series_app/features/movies/providers/movies_provider.dart';
import 'package:movies_series_app/presentation/widgets/custom_circular_progress.dart';
import 'package:movies_series_app/presentation/widgets/list_search_movies.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          TextField(
            controller: _searchController,
            autocorrect: false,
            enableSuggestions: false,
            onChanged: (value) {
              ref.read(moviesProvider.notifier).getMoviesByTitle(
                    title: value,
                  );
            },
            decoration: InputDecoration(
              filled: true,
              hintText: 'Search movie...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: const Icon(Icons.search),
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Consumer(
            builder: (builder, ref, child) {
              final movieState = ref.watch(moviesProvider);
              if (movieState.isLoading) {
                return const CustomCircularProgress();
              } else if (movieState.isErrorSearch != null) {
                return Text(movieState.isErrorSearch!);
              } else if (movieState.moviesByTitle != null) {
                final moviesByTitle = movieState.moviesByTitle!;
                return moviesByTitle.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            Text(
                              'Movie not found',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Palette.white,
                              ),
                            ),
                            Icon(
                              Icons.search_off,
                              size: 80,
                              color: Palette.white,
                            ),
                          ],
                        ),
                      )
                    : ListSearchMovies(
                        movies: moviesByTitle,
                      );
              } else if (movieState.moviesByTitle == null) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Search your movie',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Palette.white,
                        ),
                      ),
                      Icon(
                        Icons.movie_sharp,
                        size: 80,
                        color: Palette.white,
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
