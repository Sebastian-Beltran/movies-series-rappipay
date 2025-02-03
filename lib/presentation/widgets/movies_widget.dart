import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_series_app/features/movies/models/movies_model.dart';
import 'package:movies_series_app/presentation/screens/movies/movie_detail.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({
    required this.movies,
    super.key,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'movie-detail',
                arguments: MovieDetailArgs(movie: movies[index]),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://images.tmdb.org/t/p/w1280/${movies[index].poster_path}',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                },
              ),
            ),
          );
        });
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
      itemCount: movies.length > 10 ? 10 : movies.length,
      layout: SwiperLayout.STACK,
      itemWidth: 220,
      itemHeight: 250,
      autoplay: true,
    );
  }
}
