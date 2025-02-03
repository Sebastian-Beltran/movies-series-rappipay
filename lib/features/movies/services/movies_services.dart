import 'package:either_dart/either.dart';
import 'package:movies_series_app/features/movies/models/movies_model.dart';

abstract class MoviesServices {
  Future<Either<String, List<Movie>>> getMoviesPopularList();
  Future<Either<String, List<Movie>>> getMoviesTopRatedList();
  Future<Either<String, List<Movie>>> getMoviesByTitle({required String title});
}
