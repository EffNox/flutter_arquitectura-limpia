import '../either.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/movie.dart';
import '../models/performer.dart';

abstract class MoviesRepository {
  Future<Either<HttpRequestFailure, Movie>> getMovieById(int id);
  Future<Either<HttpRequestFailure, List<Performer>>> getCatsByMovie(int id);
}
