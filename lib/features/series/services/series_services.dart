import 'package:either_dart/either.dart';
import 'package:movies_series_app/features/series/models/series_model.dart';

abstract class SeriesServices {
  Future<Either<String, List<SerieTV>>> getSeriesPopularList();
  Future<Either<String, List<SerieTV>>> getSeriesTopRatedList();
}
