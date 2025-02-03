import 'package:flutter/material.dart';
import 'package:movies_series_app/features/movies/models/movies_model.dart';
import 'package:movies_series_app/presentation/widgets/card_detail_movie.dart';
import 'package:movies_series_app/presentation/widgets/custom_app_bar.dart';
import 'package:movies_series_app/presentation/widgets/image_detail.dart';

class MovieDetailArgs {
  const MovieDetailArgs({
    required this.movie,
  });
  final Movie movie;
}

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          ImageDetail(imgPath: movie.poster_path),
          Align(
            alignment: Alignment.bottomCenter,
            child: CardDetailMovie(movie: movie),
          ),
        ],
      ),
    );
  }
}
