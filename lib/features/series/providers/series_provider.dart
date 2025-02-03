import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/features/series/providers/series_state.dart';
import 'package:movies_series_app/features/series/services/series_services.dart';
import 'package:movies_series_app/features/series/services/series_services_impl.dart';

final seriesProvider =
    StateNotifierProvider<SeriesNotifier, SeriesState>(SeriesNotifier.fromRef);

class SeriesNotifier extends StateNotifier<SeriesState> {
  SeriesNotifier({
    required this.seriesServices,
    required this.ref,
  }) : super(SeriesState.initial());

  factory SeriesNotifier.fromRef(Ref ref) {
    return SeriesNotifier(
      seriesServices: ref.read(seriesServicesProvider),
      ref: ref,
    );
  }
  final SeriesServices seriesServices;
  final Ref ref;

  void resetState() => state = SeriesState.initial();

  Future<void> getSeriesPopularList() async {
    state = state.copyWith(isLoading: true);
    final res = await seriesServices.getSeriesPopularList();
    state = state.copyWith(isLoading: false);
    res.fold(
      (left) => state = state.copyWith(
        isError: left,
        isInitState: false,
      ),
      (right) => state = state.copyWith(
        seriesPopular: right,
        isInitState: false,
      ),
    );
  }

  Future<void> getSeriesTopRatedList() async {
    state = state.copyWith(isLoading: true);
    final res = await seriesServices.getSeriesTopRatedList();
    state = state.copyWith(isLoading: false);
    res.fold(
      (left) => state = state.copyWith(
        isError: left,
        isInitState: false,
      ),
      (right) => state = state.copyWith(
        seriesTopRated: right,
        isInitState: false,
      ),
    );
  }
}
