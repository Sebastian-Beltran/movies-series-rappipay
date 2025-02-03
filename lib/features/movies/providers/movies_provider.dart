import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/features/movies/providers/movie_state.dart';
import 'package:movies_series_app/features/movies/services/movies_services.dart';
import 'package:movies_series_app/features/movies/services/movies_services_impl.dart';

final moviesProvider =
    StateNotifierProvider<MovieNotifier, MovieState>(MovieNotifier.fromRef);

class MovieNotifier extends StateNotifier<MovieState> {
  MovieNotifier({
    required this.moviesServices,
    required this.ref,
  }) : super(MovieState.initial());

  factory MovieNotifier.fromRef(Ref ref) {
    return MovieNotifier(
      moviesServices: ref.read(moviesServicesProvider),
      ref: ref,
    );
  }
  final MoviesServices moviesServices;
  final Ref ref;

  void resetState() => state = MovieState.initial();

  Future<void> getMoviesPopularList() async {
    state = state.copyWith(isLoading: true);
    final res = await moviesServices.getMoviesPopularList();
    state = state.copyWith(isLoading: false);
    res.fold(
      (left) => state = state.copyWith(
        isError: left,
        isInitState: false,
      ),
      (right) => state = state.copyWith(
        moviesPopular: right,
        isInitState: false,
      ),
    );
  }

  Future<void> getMoviesTopRatedList() async {
    state = state.copyWith(isLoading: true);
    final res = await moviesServices.getMoviesTopRatedList();
    state = state.copyWith(isLoading: false);
    res.fold(
      (left) => state = state.copyWith(
        isError: left,
        isInitState: false,
      ),
      (right) => state = state.copyWith(
        moviesTopRated: right,
        isInitState: false,
      ),
    );
  }

  Future<void> getMoviesByTitle({required String title}) async {
    state = state.copyWith(isLoading: true);
    final res = await moviesServices.getMoviesByTitle(title: title);
    state = state.copyWith(isLoading: false);
    res.fold(
      (left) => state = state.copyWith(
        isErrorSearch: left,
        isInitState: false,
      ),
      (right) {
        state = state.copyWith(
          moviesByTitle: right,
          isInitState: false,
        );
      },
    );
  }
}
