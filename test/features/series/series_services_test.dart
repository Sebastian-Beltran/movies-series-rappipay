import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_series_app/core/api/request_handler.dart';
import 'package:movies_series_app/features/series/models/series_model.dart';
import 'package:movies_series_app/features/series/services/series_services_impl.dart';

import 'series_services_test.mocks.dart';

@GenerateMocks([RequestHandler])
void main() {
  final client = MockRequestHandler();
  final service = SeriesServicesImpl(client: client);
  final failure = 'Failed to get series list';
  group('Series services Test', () {
    group('Get most popular Series test', () {
      test('Get most popular series succes', () async {
        const path = '/tv/popular';
        final response = Response('''
          {
            "page": 1,
            "results": [
              {
                "id": 1,
                "adult": false,
                "name": "Name test",
                "overview": "Overview test",
                "poster_path": "/example.jpg",
                "vote_average": 9.2,
                "original_language": "en"
              },
              {
                "id": 2,
                "adult": false,
                "name": "Name test 2",
                "overview": "Overview test 2",
                "poster_path": "/example2.jpg",
                "vote_average": 7.2,
                "original_language": "en"
              }
            ]
        }
        ''', 200);
        when(client.performGet(path)).thenAnswer((_) async => response);
        final res = await service.getSeriesPopularList();
        final data = json.decode(response.body);

        verify(client.performGet(path)).called(1);
        expect(client.performGet(path), completes);
        expect(res.isRight, true);
        expect(
          res.right,
          List<SerieTV>.from(
            data['results'].map(
              (dynamic item) => SerieTV.fromJson(item as Map<String, dynamic>),
            ),
          ),
        );
      });
      test('Get most popular Series failure', () async {
        const path = '/tv/popular';
        when(client.performGet(path)).thenThrow(failure);
        try {
          await client.performGet(path);
        } catch (e) {
          expect(e, failure);
          expect(e, isA<String>());
        }
      });
    });
    group('Get top rated Series test', () {
      test('Get top rated series succes', () async {
        const path = '/tv/top_rated';
        final response = Response('''
          {
            "page": 1,
            "results": [
              {
                "id": 1,
                "adult": false,
                "name": "Name test",
                "overview": "Overview test",
                "poster_path": "/example.jpg",
                "vote_average": 9.2,
                "original_language": "en"
              },
              {
                "id": 2,
                "adult": false,
                "name": "Name test 2",
                "overview": "Overview test 2",
                "poster_path": "/example2.jpg",
                "vote_average": 7.2,
                "original_language": "en"
              }
            ]
        }
        ''', 200);
        when(client.performGet(path)).thenAnswer((_) async => response);
        final res = await service.getSeriesTopRatedList();
        final data = json.decode(response.body);

        verify(client.performGet(path)).called(1);
        expect(client.performGet(path), completes);
        expect(res.isRight, true);
        expect(
          res.right,
          List<SerieTV>.from(
            data['results'].map(
              (dynamic item) => SerieTV.fromJson(item as Map<String, dynamic>),
            ),
          ),
        );
      });
      test('Get top rated Series failure', () async {
        const path = '/tv/top_rated';
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
