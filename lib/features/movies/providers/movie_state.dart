import 'package:equatable/equatable.dart';
import 'package:movies_series_app/features/movies/models/movies_model.dart';

final class MovieState extends Equatable {
  const MovieState({
    this.moviesPopular,
    this.moviesTopRated,
    this.moviesByTitle,
    this.isLoading = false,
    this.isInitState = true,
    this.isError,
    this.isErrorSearch,
  });

  final List<Movie>? moviesPopular;
  final List<Movie>? moviesTopRated;
  final List<Movie>? moviesByTitle;
  final bool isLoading;
  final String? isError;
  final String? isErrorSearch;
  final bool isInitState;

  factory MovieState.initial() => const MovieState();

  MovieState copyWith({
    List<Movie>? moviesPopular,
    List<Movie>? moviesTopRated,
    List<Movie>? moviesByTitle,
    bool? isLoading,
    String? isError,
    String? isErrorSearch,
    bool? isInitState,
  }) {
    return MovieState(
      moviesPopular: moviesPopular ?? this.moviesPopular,
      moviesTopRated: moviesTopRated ?? this.moviesTopRated,
      moviesByTitle: moviesByTitle ?? this.moviesByTitle,
      isError: isError ?? this.isError,
      isErrorSearch: isErrorSearch ?? this.isErrorSearch,
      isLoading: isLoading ?? this.isLoading,
      isInitState: isInitState ?? this.isInitState,
    );
  }

  @override
  List<Object?> get props => [
        moviesPopular,
        moviesTopRated,
        moviesByTitle,
        isError,
        isErrorSearch,
        isInitState,
        isLoading,
      ];
}
