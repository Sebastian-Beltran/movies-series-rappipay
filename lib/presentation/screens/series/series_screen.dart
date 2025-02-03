import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_series_app/features/series/providers/series_provider.dart';
import 'package:movies_series_app/presentation/widgets/custom_circular_progress.dart';
import 'package:movies_series_app/presentation/widgets/series_widget.dart';

class SeriesScreen extends ConsumerStatefulWidget {
  const SeriesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<SeriesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(seriesProvider.notifier).getSeriesPopularList();
      ref.read(seriesProvider.notifier).getSeriesTopRatedList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Consumer(
              builder: (builder, ref, child) {
                final seriesState = ref.watch(seriesProvider);
                if (seriesState.isLoading) {
                  return const CustomCircularProgress();
                } else if (seriesState.isError != null) {
                  return Text(seriesState.isError!);
                } else if (seriesState.seriesPopular != null) {
                  final seriesPopular = seriesState.seriesPopular!;
                  return Column(
                    children: [
                      Text(
                        'Most Popular TV Series',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      SeriesWidget(series: seriesPopular),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            SizedBox(height: 40),
            Consumer(
              builder: (builder, ref, child) {
                final seriesState = ref.watch(seriesProvider);
                if (seriesState.isLoading) {
                  return const CustomCircularProgress();
                } else if (seriesState.isError != null) {
                  return Text(seriesState.isError!);
                } else if (seriesState.seriesTopRated != null) {
                  final seriesTopRated = seriesState.seriesTopRated!;
                  return Column(
                    children: [
                      Text(
                        'Top Rated TV Series',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      SeriesWidget(series: seriesTopRated),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
