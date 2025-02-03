import 'package:flutter/material.dart';
import 'package:movies_series_app/core/constants/palette.dart';
import 'package:movies_series_app/features/series/models/series_model.dart';
import 'package:movies_series_app/presentation/widgets/mini_card_widget.dart';

class CardDetailSerie extends StatelessWidget {
  const CardDetailSerie({required this.serie, super.key});

  final SerieTV serie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: size * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Center(
              child: Text(
                serie.name.toUpperCase(),
                style: TextStyle(
                  color: Palette.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MiniCardWidget(
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Palette.yellow,
                      ),
                      Text(
                        serie.vote_average.toString().substring(0, 3),
                        style: TextStyle(
                          color: Palette.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                MiniCardWidget(
                  child: Text(
                    serie.adult ? '+18' : 'PG-13',
                    style: TextStyle(
                      color: Palette.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                MiniCardWidget(
                  child: Text(
                    serie.original_language.toUpperCase(),
                    style: TextStyle(
                      color: Palette.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serie.overview,
                  style: TextStyle(
                    color: Palette.primary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
