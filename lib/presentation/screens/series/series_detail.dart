import 'package:flutter/material.dart';
import 'package:movies_series_app/features/series/models/series_model.dart';
import 'package:movies_series_app/presentation/widgets/card_detail_serie.dart';
import 'package:movies_series_app/presentation/widgets/custom_app_bar.dart';
import 'package:movies_series_app/presentation/widgets/image_detail.dart';

class SeriesDetailArgs {
  const SeriesDetailArgs({
    required this.serie,
  });
  final SerieTV serie;
}

class SeriesDetail extends StatelessWidget {
  const SeriesDetail({
    required this.serie,
    super.key,
  });

  final SerieTV serie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          ImageDetail(imgPath: serie.poster_path),
          Align(
            alignment: Alignment.bottomCenter,
            child: CardDetailSerie(serie: serie),
          ),
        ],
      ),
    );
  }
}
