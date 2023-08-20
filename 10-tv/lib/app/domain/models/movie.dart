import 'package:freezed_annotation/freezed_annotation.dart';

import '../typedefs.dart';
import 'genre.dart';
import 'media.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String overview,
    required List<Genre> genres,
    required int runtime,
    @JsonKey(readValue: readTitleValue) required String title,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'original_title', readValue: readOriginalTitleValue) required String originalTitle,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
  }) = _Movie;

  const Movie._();
  factory Movie.fromJson(Json json) => _$MovieFromJson(json);

  Media toMedia() {
    return Media(
      id: id,
      overview: overview,
      title: title,
      originalTitle: originalTitle,
      posterPath: posterPath,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      type: MediaType.movie,
    );
  }
}
