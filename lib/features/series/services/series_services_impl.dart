import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/core/api/request_handler.dart';
import 'package:movies_series_app/features/series/models/series_model.dart';
import 'package:movies_series_app/features/series/services/series_services.dart';

final seriesServicesProvider =
    Provider.autoDispose<SeriesServices>(SeriesServicesImpl.fromRef);

class SeriesServicesImpl implements SeriesServices {
  SeriesServicesImpl({
    required this.client,
  });

  factory SeriesServicesImpl.fromRef(Ref ref) {
    return SeriesServicesImpl(
      client: ref.read(requestHandlerProvider),
    );
  }

  final RequestHandler client;

  @override
  Future<Either<String, List<SerieTV>>> getSeriesPopularList() async {
    try {
      final path = '/tv/popular';

      final res = await client.performGet(path);
      final body = json.decode(
        res.body.trim(),
      );

      final listSeries = List<SerieTV>.from(
        body['results'].map(
          (dynamic item) => SerieTV.fromJson(item as Map<String, dynamic>),
        ),
      );
      return Right(listSeries);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<SerieTV>>> getSeriesTopRatedList() async {
    try {
      final path = '/tv/top_rated';

      final res = await client.performGet(path);
      final body = json.decode(
        res.body.trim(),
      );

      final listSeries = List<SerieTV>.from(
        body['results'].map(
          (dynamic item) => SerieTV.fromJson(item as Map<String, dynamic>),
        ),
      );
      return Right(listSeries);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
