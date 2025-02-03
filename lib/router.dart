import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:movies_series_app/presentation/screens/home_screen.dart';
import 'package:movies_series_app/presentation/screens/movies/movie_detail.dart';
import 'package:movies_series_app/presentation/screens/series/series_detail.dart';

class RouterFluro {
  static FluroRouter router = FluroRouter();

  final homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return HomeScreen();
    },
  );

  final movieDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      if (context != null) {
        final args = context.settings!.arguments as MovieDetailArgs;
        return MovieDetail(
          movie: args.movie,
        );
      }
      return null;
    },
  );

  final serieDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      if (context != null) {
        final args = context.settings!.arguments as SeriesDetailArgs;
        return SeriesDetail(
          serie: args.serie,
        );
      }
      return null;
    },
  );

  void setupRouter(FluroRouter router) {
    router.define('/', handler: homeHandler);
    router.define(
      'movie-detail',
      handler: movieDetailHandler,
    );
    router.define(
      'serie-detail',
      handler: serieDetailHandler,
    );
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Text("Page not found");
    });
  }
}
