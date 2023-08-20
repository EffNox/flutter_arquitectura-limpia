import '../../../domain/either.dart';
import '../../../domain/enums.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/media.dart';
import '../../../domain/models/performer.dart';
import '../../../domain/typedefs.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class TrendingAPI {
  final Http _http;
  TrendingAPI(this._http);

  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(TimeWindow timeWindow) async {
    final rs = await _http.request('/trending/all/${timeWindow.name}', onSuccess: (json) {
      final list = List<Json>.from(json['results']);
      return getMediaList(list);
    });
    return rs.when(left: handleFailure, right: (lst) => Either.right(lst));
  }

  Future<Either<HttpRequestFailure, List<Performer>>> getPerformers(TimeWindow timeWindow) async {
    final rs = await _http.request('/trending/person/${timeWindow.name}', onSuccess: (json) {
      final list = List<Json>.from(json['results']);
      return list
          .where(
            (e) => e['known_for_department'] == 'Acting' && e['profile_path'] != null,
          )
          .map((e) => Performer.fromJson(e))
          .toList();
    });
    return rs.when(left: handleFailure, right: (lst) => Either.right(lst));
  }
}
