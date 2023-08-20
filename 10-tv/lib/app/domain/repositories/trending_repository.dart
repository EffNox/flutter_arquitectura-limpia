import '../either.dart';
import '../enums.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/media.dart';
import '../models/performer.dart';

abstract class TrendingRepository {
  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(TimeWindow timeWindow);
  Future<Either<HttpRequestFailure, List<Performer>>> getPerformers(TimeWindow timeWindow);
}
