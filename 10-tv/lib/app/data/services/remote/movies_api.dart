import '../../../domain/either.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/movie.dart';
import '../../../domain/models/performer.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class MoviesAPI {
  final Http _http;

  MoviesAPI(this._http);

  Future<Either<HttpRequestFailure, Movie>> getMovieById(int id) async {
    final rs = await _http.request('/movie/$id', onSuccess: (json) => Movie.fromJson(json));
    return rs.when(left: handleFailure, right: (movie) => Either.right(movie));
  }

  Future<Either<HttpRequestFailure, List<Performer>>> getCatsByMovie(int movieId) async {
    final rs = await _http.request('/movie/$movieId/credits', onSuccess: (json) {
      final list = json['cast'] as List;
      return list
          .where(
            (e) => e['known_for_department'] == 'Acting' && e['profile_path'] != null,
          )
          .map((e) => Performer.fromJson({...e, 'known_for': []}))
          .toList();
    });
    return rs.when(left: handleFailure, right: (cast) => Either.right(cast));
  }
}
