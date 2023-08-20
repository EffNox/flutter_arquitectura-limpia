import '../../../domain/either.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/media.dart';
import '../../../domain/models/user.dart';
import '../../http/http.dart';
import '../local/session_service.dart';
import '../utils/handle_failure.dart';

class AccountAPI {
  AccountAPI(this._http, this._sessionService);

  final Http _http;
  final SessionService _sessionService;

  Future<User?> getAccount(String sessionId) async {
    final rs = await _http.request(
      '/account',
      queryParameters: {'session_id': sessionId},
      onSuccess: (json) => User.fromJson(json),
    );
    return rs.when(left: (_) => null, right: (user) => user);
  }

  Future<Either<HttpRequestFailure, Map<int, Media>>> getFavorites(MediaType type) async {
    final sessionId = await _sessionService.sessionId ?? '';
    final accountId = await _sessionService.accountId;

    final rs = await _http.request(
      '/account/$accountId/favorite/${type == MediaType.movie ? 'movies' : 'tv'}',
      queryParameters: {'session_id': sessionId},
      onSuccess: (json) {
        final list = json['results'] as List;
        final itr = list.map((e) {
          final media = Media.fromJson({...e, 'media_type': type.name});
          return MapEntry(media.id, media);
        });

        final map = <int, Media>{};
        map.addEntries(itr);
        return map;
      },
    );

    return rs.when(left: handleFailure, right: (v) => Either.right(v));
  }

  Future<Either<HttpRequestFailure, void>> markAsFavorite({required int mediaId, required MediaType type, required bool favorite}) async {
    final sessionId = await _sessionService.sessionId ?? '';
    final accountId = await _sessionService.accountId;

    final rs = await _http.request(
      '/account/$accountId/favorite',
      queryParameters: {'session_id': sessionId},
      body: {'media_type': type.name, 'media_id': mediaId, 'favorite': favorite},
      method: HttpMethod.post,
      onSuccess: (_) => null,
    );
    return rs.when(left: handleFailure, right: (_) => Either.right(null));
  }
}
