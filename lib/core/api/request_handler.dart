// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

final requestHandlerProvider = Provider<RequestHandler>(RequestHandlerImpl.new);

abstract class RequestHandler {
  Future<Response> performGet(String path);
}

class RequestHandlerImpl extends RequestHandler {
  RequestHandlerImpl(this.ref);

  final Ref ref;

  @override
  Future<Response> performGet(String path) async {
    try {
      final res = await http.get(
        _apiURL(path),
        headers: headers,
      );
      print('GET:');
      print(res.body);
      return res;
    } catch (e) {
      print('ERROR GET');
      print(e.toString());
      rethrow;
    }
  }

  Uri _apiURL(String path) {
    return Uri.parse('$basePath$path');
  }

  final String basePath = 'https://api.themoviedb.org/3/';

  final headers = <String, String>{
    'Content-type': 'application/json; charset=UTF-8',
    'accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhN2NmYWQzNGY2ODQ2OGQ1ODYwZWE1MWFkNzYzMjIyZiIsIm5iZiI6MTczODM2NTQ2Mi4xMDMwMDAyLCJzdWIiOiI2NzlkNWExNjBkMTlmMzBhYzE5NTJhOTUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.x8gxZSaJo185j9foKel-bv2BP7lDrwF-6E0xJS8J4l0'
  };
}
