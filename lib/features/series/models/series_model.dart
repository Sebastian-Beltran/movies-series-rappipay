// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_model.freezed.dart';
part 'series_model.g.dart';

@freezed
class SerieTV with _$SerieTV {
  const factory SerieTV({
    required int id,
    required String name,
    required String poster_path,
    required String original_language,
    required String overview,
    required double vote_average,
    required bool adult,
  }) = _SerieTV;

  factory SerieTV.fromJson(Map<String, dynamic> json) =>
      _$SerieTVFromJson(json);
}
