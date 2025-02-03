import 'package:equatable/equatable.dart';
import 'package:movies_series_app/features/series/models/series_model.dart';

final class SeriesState extends Equatable {
  const SeriesState({
    this.seriesPopular,
    this.seriesTopRated,
    this.isLoading = false,
    this.isInitState = true,
    this.isError,
  });

  final List<SerieTV>? seriesPopular;
  final List<SerieTV>? seriesTopRated;
  final bool isLoading;
  final String? isError;
  final bool isInitState;

  factory SeriesState.initial() => const SeriesState();

  SeriesState copyWith({
    List<SerieTV>? seriesPopular,
    List<SerieTV>? seriesTopRated,
    bool? isLoading,
    String? isError,
    bool? isInitState,
  }) {
    return SeriesState(
      seriesPopular: seriesPopular ?? this.seriesPopular,
      seriesTopRated: seriesTopRated ?? this.seriesTopRated,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isInitState: isInitState ?? this.isInitState,
    );
  }

  @override
  List<Object?> get props => [
        seriesPopular,
        seriesTopRated,
        isError,
        isInitState,
        isLoading,
      ];
}
