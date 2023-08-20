import '../../../../domain/repositories/movies_repository.dart';
import '../../../global/state_notifier.dart';
import '../state/movie_state.dart';

class MovieController extends StateNotifier<MovieState> {
  MovieController(super.state, {required this.id, required this.moviesRepository});

  final MoviesRepository moviesRepository;
  final int id;

  Future<void> init() async {
    state = MovieState.loading();
    final rs = await moviesRepository.getMovieById(id);
    state = rs.when(left: (_) => MovieState.failed(), right: (movie) => MovieState.loaded(movie));
  }
}
