import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_series_app/core/api/request_handler.dart';
import 'package:movies_series_app/features/movies/models/movies_model.dart';
import 'package:movies_series_app/features/movies/services/movies_services_impl.dart';
import 'movies_services_test.mocks.dart';

@GenerateMocks([RequestHandler])
void main() {
  final client = MockRequestHandler();
  final service = MoviesServicesImpl(client: client);
  final failure = 'Failed to get movies list';
  group('Movies services Test', () {
    group('Get most popular Movies test', () {
      test('Get most popular movies succes', () async {
        const path = '/movie/popular';
        final response = Response('''
          {
            "page": 1,
            "results": [
              {
                "id": 1,
                "adult": false,
                "title": "Name test",
                "overview": "Overview test",
                "poster_path": "/example.jpg",
                "vote_average": 9.2,
                "original_language": "en"
              },
              {
                "id": 2,
                "adult": false,
                "title": "Name test 2",
                "overview": "Overview test 2",
                "poster_path": "/example2.jpg",
                "vote_average": 7.2,
                "original_language": "en"
              }
            ]
        }
        ''', 200);
        when(client.performGet(path)).thenAnswer((_) async => response);
        final res = await service.getMoviesPopularList();
        final data = json.decode(response.body);

        verify(client.performGet(path)).called(1);
        expect(client.performGet(path), completes);
        expect(res.isRight, true);
        expect(
          res.right,
          List<Movie>.from(
            data['results'].map(
              (dynamic item) => Movie.fromJson(item as Map<String, dynamic>),
            ),
          ),
        );
      });
      test('Get most popular Movies failure', () async {
        const path = '/movie/popular';
        when(client.performGet(path)).thenThrow(failure);
        try {
          await client.performGet(path);
        } catch (e) {
          expect(e, failure);
          expect(e, isA<String>());
        }
      });
    });
    group('Get top rated Movies test', () {
      test('Get top rated movies succes', () async {
        const path = '/movie/top_rated';
        final response = Response('''
          {
            "page": 1,
            "results": [
              {
                "id": 1,
                "adult": false,
                "title": "Name test",
                "overview": "Overview test",
                "poster_path": "/example.jpg",
                "vote_average": 9.2,
                "original_language": "en"
              },
              {
                "id": 2,
                "adult": false,
                "title": "Name test 2",
                "overview": "Overview test 2",
                "poster_path": "/example2.jpg",
                "vote_average": 7.2,
                "original_language": "en"
              }
            ]
        }
        ''', 200);
        when(client.performGet(path)).thenAnswer((_) async => response);
        final res = await service.getMoviesTopRatedList();
        final data = json.decode(response.body);

        verify(client.performGet(path)).called(1);
        expect(client.performGet(path), completes);
        expect(res.isRight, true);
        expect(
          res.right,
          List<Movie>.from(
            data['results'].map(
              (dynamic item) => Movie.fromJson(item as Map<String, dynamic>),
            ),
          ),
        );
      });
      test('Get top rated Movies failure', () async {
        const path = '/movie/top_rated';
        when(client.performGet(path)).thenThrow(failure);
        try {
          await client.performGet(path);
        } catch (e) {
          expect(e, failure);
          expect(e, isA<String>());
        }
      });
    });
  });
}
