import '../../domain/either.dart';
import '../../domain/enums.dart';
import '../../domain/failures/http_request/http_request_failure.dart';
import '../../domain/models/media.dart';
import '../../domain/models/performer.dart';
import '../../domain/repositories/trending_repository.dart';
import '../services/remote/trending_api.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingAPI _trendingAPI;

  TrendingRepositoryImpl(this._trendingAPI);

  @override
  Future<Either<HttpRequestFailure, List<Media>>> getMoviesAndSeries(TimeWindow timeWindow) {
    return _trendingAPI.getMoviesAndSeries(timeWindow);
  }

  @override
  Future<Either<HttpRequestFailure, List<Performer>>> getPerformers(TimeWindow timeWindow) {
    return _trendingAPI.getPerformers(timeWindow);
  }
}
