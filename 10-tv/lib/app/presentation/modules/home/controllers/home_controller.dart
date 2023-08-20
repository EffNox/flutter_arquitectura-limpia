import '../../../../domain/enums.dart';
import '../../../../domain/repositories/trending_repository.dart';
import '../../../global/state_notifier.dart';
import 'state/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(super.state, {required this.trendingRepository});

  final TrendingRepository trendingRepository;

  Future<void> init() async {
    await loadMoviesAndSeries();
    await loadPerformers();
  }

  Future<void> loadMoviesAndSeries({MoviesAndSeriesState? moviesAndSeries}) async {
    if (moviesAndSeries != null) state = state.copyWith(moviesAndSeries: moviesAndSeries);

    final rs = await trendingRepository.getMoviesAndSeries(state.moviesAndSeries.timeWindow);
    state = rs.when(
      left: (v) => state.copyWith(moviesAndSeries: MoviesAndSeriesState.failed(state.moviesAndSeries.timeWindow)),
      right: (lst) => state.copyWith(moviesAndSeries: MoviesAndSeriesLoaded(lst: lst, timeWindow: state.moviesAndSeries.timeWindow)),
    );
  }

  Future<void> loadPerformers({PerformersState? performers}) async {
    if (performers != null) state = state.copyWith(performers: performers);

    final rs = await trendingRepository.getPerformers(TimeWindow.day);
    state = rs.when(
      left: (v) => state.copyWith(performers: const PerformersStateFailed()),
      right: (lst) => state.copyWith(performers: PerformersStateLoaded(lst)),
    );
  }

  void onTimeWindowChanged(TimeWindow timeWindow) {
    if (state.moviesAndSeries.timeWindow != timeWindow) {
      state = state.copyWith(moviesAndSeries: MoviesAndSeriesLoading(timeWindow));
    }
    loadMoviesAndSeries();
  }
}
