import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_series_app/features/series/models/series_model.dart';
import 'package:movies_series_app/presentation/screens/series/series_detail.dart';

class SeriesWidget extends StatelessWidget {
  const SeriesWidget({
    required this.series,
    super.key,
  });

  final List<SerieTV> series;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              'serie-detail',
              arguments: SeriesDetailArgs(serie: series[index]),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://images.tmdb.org/t/p/w1280/${series[index].poster_path}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
        );
      },
      pagination: SwiperPagination(
        margin: EdgeInsets.only(top: 270),
        builder: DotSwiperPaginationBuilder(
          color: Colors.white30,
          activeColor: Colors.white,
          size: 15,
          activeSize: 15,
        ),
      ),
      itemCount: series.length > 10 ? 10 : series.length,
      layout: SwiperLayout.STACK,
      itemWidth: 220,
      itemHeight: 250,
      autoplay: true,
    );
  }
}
