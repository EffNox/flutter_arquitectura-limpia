import '../../../../domain/either.dart';
import '../../../../domain/failures/http_request/http_request_failure.dart';
import '../../../../domain/models/media.dart';
import '../../../../domain/repositories/account_repository.dart';
import '../../state_notifier.dart';
import 'state/favorites_state.dart';

class FavoritesController extends StateNotifier<FavoritesState> {
  FavoritesController(super.state, {required this.accountRepository});

  final AccountRepository accountRepository;

  Future<void> init() async {
    state = FavoritesState.loading();

    final rsMovie = await accountRepository.getFavorites(MediaType.movie);
    state = await rsMovie.when(
        left: (_) async => FavoritesState.failed(),
        right: (movies) async {
          final rs = await accountRepository.getFavorites(MediaType.tv);
          return rs.when(
            left: (_) => FavoritesState.failed(),
            right: (series) => FavoritesState.loaded(movies: movies, series: series),
          );
        });
  }

  Future<Either<HttpRequestFailure, void>> markAsFavorite(Media media) async {
    assert(state is FavoritesStateLoaded);
    final loadedState = state as FavoritesStateLoaded;

    final isMovie = media.type == MediaType.movie;
    final map = {...isMovie ? loadedState.movies : loadedState.series};
    final favorite = !map.keys.contains(media.id);
    final rs = await accountRepository.markAsFavorite(mediaId: media.id, type: media.type, favorite: favorite);

    rs.whenOrNull(right: (v) {
      if (favorite) {
        map[media.id] = media;
      } else {
        map.remove(media.id);
      }
      state = isMovie ? loadedState.copyWith(movies: map) : loadedState.copyWith(series: map);
    });
    return rs;
  }
}
