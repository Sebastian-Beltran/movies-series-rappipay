// filepath: /Users/sebastianbeltran/Documents/Dev/Pruebas/movies_series_app/test/presentation/screens/movies/movies_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_series_app/features/movies/models/movies_model.dart';
import 'package:movies_series_app/features/movies/providers/movie_state.dart';
import 'package:movies_series_app/features/movies/providers/movies_provider.dart';
import 'package:movies_series_app/presentation/screens/movies/movies_screen.dart';

class MockMoviesNotifier extends Mock implements MovieNotifier {}

void main() {
  late MockMoviesNotifier mockMoviesNotifier;

  setUp(() {
    mockMoviesNotifier = MockMoviesNotifier();
  });
  group('Movies screen test', () {
    testWidgets('MoviesScreen shows loading indicator when loading',
        (WidgetTester tester) async {
      when(mockMoviesNotifier.state).thenReturn(MovieState(
        isLoading: true,
      ));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            moviesProvider.overrideWith((ref) => mockMoviesNotifier),
          ],
          child: MaterialApp(
            home: MoviesScreen(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('MoviesScreen shows error message when there is an error',
        (WidgetTester tester) async {
      when(mockMoviesNotifier.state)
          .thenReturn(MovieState(isError: 'Error loading movies'));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            moviesProvider.overrideWith((ref) => mockMoviesNotifier),
          ],
          child: MaterialApp(
            home: MoviesScreen(),
          ),
        ),
      );

      expect(find.text('Error loading movies'), findsOneWidget);
    });

    testWidgets('MoviesScreen shows movies list when data is loaded',
        (WidgetTester tester) async {
      final movies = [
        Movie(
          id: 1,
          title: 'Movie 1',
          poster_path: '/path1.jpg',
          original_language: 'en',
          overview: 'Overview 1',
          vote_average: 5.0,
          adult: false,
        ),
        Movie(
          id: 2,
          title: 'Movie 2',
          poster_path: '/path2.jpg',
          original_language: 'en',
          overview: 'Overview 1',
          vote_average: 5.0,
          adult: false,
        ),
      ];
      when(mockMoviesNotifier.state)
          .thenReturn(MovieState(moviesPopular: movies));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            moviesProvider.overrideWith((ref) => mockMoviesNotifier),
          ],
          child: MaterialApp(
            home: MoviesScreen(),
          ),
        ),
      );

      expect(find.text('Movie 1'), findsOneWidget);
      expect(find.text('Movie 2'), findsOneWidget);
    });
  });
}
