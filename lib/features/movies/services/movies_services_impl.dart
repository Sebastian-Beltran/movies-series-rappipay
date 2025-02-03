import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/core/api/request_handler.dart';
import 'package:movies_series_app/features/movies/models/movies_model.dart';
import 'package:movies_series_app/features/movies/services/movies_services.dart';

final moviesServicesProvider =
    Provider.autoDispose<MoviesServices>(MoviesServicesImpl.fromRef);

class MoviesServicesImpl implements MoviesServices {
  MoviesServicesImpl({
    required this.client,
  });

  factory MoviesServicesImpl.fromRef(Ref ref) {
    return MoviesServicesImpl(
      client: ref.read(requestHandlerProvider),
    );
  }

  final RequestHandler client;

  @override
  Future<Either<String, List<Movie>>> getMoviesPopularList() async {
    try {
      final path = '/movie/popular';

      final res = await client.performGet(path);
      final body = json.decode(
        res.body.trim(),
      );

      final listMovies = List<Movie>.from(
        body['results'].map(
          (dynamic item) => Movie.fromJson(item as Map<String, dynamic>),
        ),
      );
      return Right(listMovies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Movie>>> getMoviesTopRatedList() async {
    try {
      final path = '/movie/top_rated';

      final res = await client.performGet(path);
      final body = json.decode(
        res.body.trim(),
      );

      final listMovies = List<Movie>.from(
        body['results'].map(
          (dynamic item) => Movie.fromJson(item as Map<String, dynamic>),
        ),
      );
      return Right(listMovies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Movie>>> getMoviesByTitle({
    required String title,
  }) async {
    try {
      final path = '/search/movie?query=$title';

      final res = await client.performGet(path);
      final body = json.decode(
        res.body.trim(),
      );

      final listMovies = List<Movie>.from(
        body['results'].map(
          (dynamic item) => Movie.fromJson(item as Map<String, dynamic>),
        ),
      );
      return Right(listMovies);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
