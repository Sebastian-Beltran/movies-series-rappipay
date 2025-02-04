import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_series_app/features/movies/models/movies_model.dart';
import 'package:movies_series_app/presentation/widgets/card_detail_movie.dart';

void main() {
  group('Testing card detail movie', () {
    testWidgets('Testing card detail movie', (tester) async {
      final movie = Movie(
        id: 1,
        title: "serie",
        poster_path: "poster_path",
        original_language: "original_language",
        overview: "overview",
        vote_average: 7,
        adult: false,
      );
      final childWidget = CardDetailMovie(movie: movie);
      await tester.pumpWidget(
        MaterialApp(home: Container(child: childWidget)),
      );
      expect(find.byWidget(childWidget), findsOneWidget);
    });
  });
}
