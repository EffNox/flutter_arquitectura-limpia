import 'package:freezed_annotation/freezed_annotation.dart';

import '../typedefs.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  // @JsonKey(name: 'userId')
  const factory User({
    required int id,
    required String username,
    @JsonKey(fromJson: avatarPathFromJson, name: 'avatar') String? avatarPath,
  }) = _User;
  factory User.fromJson(Json json) => _$UserFromJson(json);

  // Para crear funciones personalizadas en una clase 'getFormatted()'
  const User._();

  String getFormatted() => '$username $id';
}

avatarPathFromJson(Json json) => json['tmdb']?['avatar_path'] as String?;
