import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../domain/either.dart';
import '../../generated/translations.g.dart';

part 'failure.dart';
part 'logs.dart';
part 'parse_response_body.dart';

enum HttpMethod { get, post, put, patch, delete }

// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMTcxMTliODM4MWY0MWI0YTg4OTY0OGI2ZDgzMDc4ZiIsInN1YiI6IjVlMzgzMmFjOThmMWYxMDAxMjA2OTViNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pxzSawG-_iM5IiB6uBoOB7cpO-lFGQAFDVu85P_E2_o
class Http {
  final Client _client;
  final String _api;
  final String _apiKey;

  Http({
    required Client client,
    required String api,
    required String apiKey,
  })  : _client = client,
        _api = api,
        _apiKey = apiKey;

  Future<Either<HttpFailure, R>> request<R>(
    String path, {
    required R Function(dynamic responseBody) onSuccess,
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> body = const {},
    bool useApiKey = true,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    Map<String, dynamic> logs = {};
    StackTrace? stackTrace;
    try {
      if (useApiKey) queryParameters = {...queryParameters, 'api_key': _apiKey};

      var url = Uri.parse(path.startsWith('http') ? path : '$_api$path');
      if (queryParameters.isNotEmpty) url = url.replace(queryParameters: {...queryParameters, 'language': LocaleSettings.currentLocale.languageTag});

      headers = {'Content-Type': 'application/json', ...headers};

      late final Response rs;
      final bodyString = jsonEncode(body);

      logs = {'url': url.toString(), 'method': method.name, 'body': body, 'initTime': DateTime.now().toString()};

      // await Future.delayed(const Duration(seconds: 3));
      rs = await switch (method) {
        HttpMethod.get => _client.get(url).timeout(timeout),
        HttpMethod.post => _client.post(url, headers: headers, body: bodyString).timeout(timeout),
        HttpMethod.put => _client.put(url, headers: headers, body: bodyString).timeout(timeout),
        HttpMethod.patch => _client.patch(url, headers: headers, body: bodyString).timeout(timeout),
        HttpMethod.delete => _client.delete(url, headers: headers).timeout(timeout)
      };
      final code = rs.statusCode;

      final responseBody = _parseResponseBody(rs.body);
      logs = {...logs, 'code': code, 'rsBody': responseBody};

      if (code >= 200 && code < 300) return Either.right(onSuccess(responseBody));

      return Either.left(HttpFailure(statusCode: code, data: responseBody));
    } catch (e, s) {
      stackTrace = s;
      logs = {...logs, 'exception': e.toString()};

      if (e is SocketException || e is ClientException) {
        logs = {...logs, 'exception': 'NetworkException'};
        return Either.left(HttpFailure(exception: NetworkException()));
      }
      return Either.left(HttpFailure(exception: e));
    } finally {
      logs = {...logs, 'endTime': DateTime.now().toString()};
      _printLogs(logs, stackTrace);
    }
  }
}
